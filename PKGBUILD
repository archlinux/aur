# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=ktxutils-git
_pkgbase=ktxutils
pkgver=r19.fc58a3c
pkgrel=1
pkgdesc="Utilities for the KTX texture format"
license=('MIT')
arch=('any')
url="http://github.com/ekpyron/${_pkgbase}/"
depends=('glfw' 'imagemagick' 'glew')
makedepends=('cmake')
source=("git+git://github.com/ekpyron/${_pkgbase}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/${_pkgbase}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/${_pkgbase}
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "${srcdir}/${_pkgbase}/build"
  make install DESTDIR="${pkgdir}"
}
