# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vtm"
pkgver=0.9.99.20
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('x86_64')
url="https://github.com/directvt/${pkgname}"
license=('MIT')
makedepends=('cmake>=3.8')
depends=('gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('949e92f8b1d30aecabcc245987dea1b12e8ad8c65bcbb48b88bb77027c187b6a7ce4b81e30dce6a4526737309d208bf03ac6097295210eda8e8bcd30c9b37c97')

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
