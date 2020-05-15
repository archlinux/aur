# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=epy-git
_name=epy
provides=('epy')
pkgver=r79.45c1cde
pkgrel=1
pkgdesc="CLI Ebook Reader, fork of epr with minor improvements"
arch=('any')
url='https://github.com/wustho/epy'
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-setuptools'
)
source=("git+https://github.com/wustho/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_name
    python setup.py build
}

package() {
    install -D "$srcdir/$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
    cd $_name
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
