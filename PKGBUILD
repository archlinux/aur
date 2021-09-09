# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

_name=premailer
pkgname=python-$_name-git
pkgver=r356.f4ded0b
pkgrel=1
pkgdesc="Turns CSS blocks into style attributes"
url="https://premailer.io/"
depends=(
    'python-lxml'
    'python-cssselect'
    'python-cssutils'
    'python-requests'
    'python-cachetools'
)
makedepends=('python-setuptools' 'git')
provides=("python-$_name")
conflicts=("python-$_name")
license=('BSD')
arch=('any')
source=(git+https://github.com/peterbe/premailer.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/${_name}
    python setup.py build
}

package() {
    cd $srcdir/${_name}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # Install license
    _licensedir=$pkgdir/usr/share/licenses/$pkgname/
    install -d $_licensedir
    install -m644 LICENSE $_licensedir
}
