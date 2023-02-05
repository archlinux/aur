# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-paint
pkgver=1.0.1
pkgrel=1
pkgdesc='Library for abstraction of the Vulkan API'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
depends=('gcc-libs' 'vulkan-icd-loader')
makedepends=('cmake' 'glm' 'glslang' 'vulkan-headers')
options=('!emptydirs')
source=("https://github.com/copperspice/cs_paint/archive/paint-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dd862c7141b4ba9b97430a65a35ef74de0ea8f824575f8ed40242982d2b3d8f9')

build() {
    cmake -B build -S "cs_paint-paint-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_paint-paint-${pkgver}/src"/*.h -t "${pkgdir}/usr/include"
    install -D -m644 "cs_paint-paint-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr"/{bin/CsPaintDemo,{include,lib/cmake}/glm,lib/pkgconfig/glm.pc}
}
