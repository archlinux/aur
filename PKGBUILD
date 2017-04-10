# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=oglplus
pkgver=0.70.0
pkgrel=1
pkgdesc="A C++ wrapper for modern OpenGL"
arch=('i686' 'x86_64')
url="https://github.com/matus-chochlik/oglplus"
license=('custom:boost')
makedepends=('cmake' 'boost' 'freeglut' 'glew' 'libpng' 'sdl')
optdepends=('boost' 'freeglut' 'glew' 'libpng' 'sdl')
provides=('oglplus')
source=("https://github.com/matus-chochlik/oglplus/archive/${pkgver}.tar.gz")
sha256sums=('92111896d60869452e75d370ce472353bc5e43c6afe4748048fa94c5f0432160')

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
