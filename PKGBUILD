# Maintainer: llm96 <llm96@fervidex.net>

pkgname=safetyhook
pkgver=0.7.0
pkgrel=1
pkgdesc='C++23 procedure hooking library.'
arch=('x86_64')
url="https://github.com/cursey/safetyhook"
license=('BSL-1.0')
depends=('zydis')
makedepends=('git' 'cmake' 'doxygen')
source=("https://github.com/cursey/safetyhook/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('72a738986c73f7b78bf1eb41680e8aacf5df5664fe23c8d96d7c018f170282ab')

build() {
  cmake \
    -B build \
    -S "${pkgname}-${pkgver}" \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -D CMKR_SKIP_GENERATION=ON \
    -D SAFETYHOOK_BUILD_DOCS=ON \
    -D SAFETYHOOK_FETCH_ZYDIS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "${pkgname}-${pkgver}"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs/html "${pkgdir}/usr/share/doc/${pkgname}/html"
}
