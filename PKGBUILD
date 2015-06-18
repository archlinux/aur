# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=webkit2png-git
pkgver=r98.520112e
pkgrel=1
pkgdesc="Takes screenshots using webkit"
arch=('i686' 'x86_64')
url="https://github.com/adamn/python-webkit2png"
license=('GPL')
depends=('python2' 'python2-pyqt4' 'qtwebkit')
makedepends=('git')
source=("$pkgname::git+https://github.com/adamn/python-webkit2png.git"
        "webkit2png.patch")
sha256sums=('SKIP'
            '71c900fe1523ed7333454a517f8ce3db5dd6e35edb02f83833dfb82d5d3dcde3')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  patch -p0 -i "$srcdir/webkit2png.patch"
}

build() {
  cd "$pkgname"
  python2 setup.py build
}

package() {
  cd "$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

