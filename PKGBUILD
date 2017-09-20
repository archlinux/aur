# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=oglplus
pkgver=0.71.0
pkgrel=1
pkgdesc="A C++ wrapper for modern OpenGL"
arch=('i686' 'x86_64')
url="https://github.com/matus-chochlik/oglplus"
license=('custom:boost')
makedepends=('cmake' 'boost' 'freeglut' 'glew' 'libpng' 'sdl')
optdepends=('boost' 'freeglut' 'glew' 'libpng' 'sdl')
provides=('oglplus')
source=("https://github.com/matus-chochlik/oglplus/archive/${pkgver}.tar.gz")
sha256sums=('0ade245e1f0b5de42e099ef643ac78b896ec67b889cadb99a1eac0b3e8532692')

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
