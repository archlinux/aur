# Maintainer: mbb <mochobb at clix dot pt>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Fabio Loli <loli_fabio@protonmail.com>

pkgname=falkon-pdfreader-git
pkgver=r7.eefc135
pkgrel=3
pkgdesc="PDF reader plugin for Falkon browser"
arch=(any)
url="https://github.com/Tarptaeya/PDFReader"
license=(GPL3)
depends=(falkon)
makedepends=(git cmake extra-cmake-modules)
provides=(falkon-pdfreader)
conficts=(falkon-pdfreader)
source=("${pkgname%-git}::git+https://github.com/Tarptaeya/PDFReader.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  install -d build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="${pkgdir}" install
}
