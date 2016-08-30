# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=oglplus
pkgver=0.68.0
_dirver=0.68
pkgrel=2
pkgdesc="A C++ wrapper for modern OpenGL"
arch=('i686' 'x86_64')
url="http://oglplus.org/"
license=('custom:boost')
makedepends=('cmake' 'boost' 'freeglut' 'glew' 'libpng' 'sdl')
optdepends=('boost' 'freeglut' 'glew' 'libpng' 'sdl')
provides=('oglplus')
source=("http://downloads.sourceforge.net/project/oglplus/oglplus-${_dirver}.x/oglplus-${pkgver}.tar.gz")
sha256sums=('d080b5b18d5f858d2ab1feec92c599f725a2c92840aab4a9010ef4f160baa763')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure.sh --prefix /usr --no-examples --no-docs
  cd _build
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/_build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/oglplus/LICENSE"
}
