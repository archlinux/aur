# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=oglplus
pkgver=0.69.0
pkgrel=1
pkgdesc="A C++ wrapper for modern OpenGL"
arch=('i686' 'x86_64')
url="https://github.com/matus-chochlik/oglplus"
license=('custom:boost')
makedepends=('cmake' 'boost' 'freeglut' 'glew' 'libpng' 'sdl')
optdepends=('boost' 'freeglut' 'glew' 'libpng' 'sdl')
provides=('oglplus')
source=("https://github.com/matus-chochlik/oglplus/archive/${pkgver}.tar.gz")
sha256sums=('de87785473742e9e699cc87fe351e2d385f3335dcc298e3b45a7dbbb1c76ff77')

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
