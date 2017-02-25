# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=ktxutils-git
_pkgbase=ktxutils
pkgver=r18.e55bfcb
pkgrel=1
pkgdesc="Utilities for the KTX texture format"
license=('MIT')
arch=('any')
url="http://github.com/ekpyron/${_pkgbase}/"
depends=('glfw' 'imagemagick' 'glew')
makedepends=('cmake')
source=("git+git://github.com/ekpyron/${_pkgbase}" 0001-hack-to-fix-build-on-Arch.patch)
md5sums=('SKIP' '7d4d3bd2bdf79b2ac99d3306f54539b7')

prepare() {
  cd "$srcdir"/${_pkgbase}
  git am ../0001-hack-to-fix-build-on-Arch.patch
}

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
