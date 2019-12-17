# Maintainer: Hexchain Tong <i@hexchain.org>

pkgname=coursera-dl
pkgver=0.11.5
pkgrel=1
pkgdesc="Script for downloading Coursera.org videos and naming them"
arch=('any')
url="https://github.com/coursera-dl/coursera-dl/"
license=('LGPL3')
depends=(
    'python' 'python-pyasn1' 'python-urllib3' 'python-beautifulsoup4'
    'python-setuptools' 'python-requests' 'python-six' 'python-keyring'
    'python-configargparse' 'python-attrs')
makedepends=('git' 'pandoc')
source=("git+https://github.com/coursera-dl/coursera-dl.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  export LC_CTYPE="en_US.UTF-8"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --skip-build --optimize=1 --prefix="/usr" --root="$pkgdir"
  install -Dm755 coursera-dl "$pkgdir/usr/bin/coursera-dl"
}
