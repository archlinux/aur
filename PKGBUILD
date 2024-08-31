# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="hnswlib"
pkgver=0.8.0
pkgrel=1
pkgdesc="Header-only C++ library for fast approximate nearest neighbors"
arch=('any')
url="https://github.com/nmslib/${pkgname}"
license=('Apache-2.0')
makedepends=('cmake')
optdepends=("python-${pkgname}: Python bindings support")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cf61d7dd8dc9bfba7f4abe0ed26698e90ac9f49a0badb2e1b0f3ba89b72cf3bb')

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DHNSWLIB_EXAMPLES:BOOL=OFF \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md"      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
