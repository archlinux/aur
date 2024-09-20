# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=0.9.99.11
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('x86_64')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
makedepends=('cmake>=3.8')
depends=('gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4c6e7d6dffa9052a2092c2c2b0f02b40cbe977e4e24654bb1c9ca15af208717b')

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
