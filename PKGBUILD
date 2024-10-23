# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=0.9.99.28
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake>=3.8')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('0f12dc49d832fe3973b1648ffec52c92174e7886a66332f17229fe84718e3deba9bb2610f85b8b92a851ae73f12eb159d91474e9e4977e58b4498cdfbe0e476a')

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
