# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=webkit2png-git
pkgver=r115.4a82a81
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
            '0d07aa551c657ea6635a02a4f0962fde59f25bf30890d0ff043cf70f3d07a330')

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

