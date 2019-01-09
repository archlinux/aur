# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-symbols
_pkgver="5.0.2"
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Official KiCad schematic symbol libraries -- stable release"
arch=('any')
url="https://kicad.github.io/symbols"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library' 'kicad-symbols-git' 'kicad-pretty-git')
provides=($pkgname)
source=("https://github.com/KiCad/kicad-symbols/archive/${_pkgver}.tar.gz")
md5sums=('12d1baa4b77f6aa90c0ebe013934bf11')

prepare() {
  cd "${pkgname}-${_pkgver}"
}

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${pkgname}-${_pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  cp -a ../${pkgname}-${_pkgver}/legacy "${pkgdir}/usr/share/kicad/library/."

}
