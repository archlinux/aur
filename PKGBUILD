# Maintainer: llm96 <llm96@fervidex.net>

pkgname=safetyhook
pkgver=0.6.7
pkgrel=1
pkgdesc='C++23 procedure hooking library.'
arch=('x86_64')
url="https://github.com/cursey/safetyhook"
license=('BSL-1.0')
depends=('zydis')
makedepends=('git' 'cmake' 'doxygen')
source=("https://github.com/cursey/safetyhook/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('05e66f9a1ac85249f590149a146e74fd946950cfe0c82917e5a4ec178e9e212a')

build() {
  cmake \
    -B build \
    -S "${pkgname}-${pkgver}" \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
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
