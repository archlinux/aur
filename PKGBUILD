# Maintainer: Zhiya Luo <luozhiya@petalmail.com>

pkgname=mogan
pkgver=r199.ff87305
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url='https://github.com/XmacsLabs/mogan'
license=('GPL3')
depends=("qt5-base" "qt5-svg" "freetype2" "sqlite" "libpng" "libiconv" "zlib" "libjpeg" "curl")
makedepends=("git" "cmake" "ninja")
optdepends=()
source=("${pkgname}::git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cmake -S"${pkgname}" -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTEXMACS_GUI=Qt5
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install
}

# vim:set sw=2 sts=2 et:
