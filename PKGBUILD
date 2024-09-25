# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-paint
pkgver=1.0.2
pkgrel=1
pkgdesc='Library for abstraction of the Vulkan API'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
depends=('gcc-libs' 'vulkan-icd-loader')
makedepends=('cmake' 'glm' 'glslang' 'vulkan-headers')
options=('!emptydirs')
source=("https://github.com/copperspice/cs_paint/archive/paint-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c09c562d3efe02ef2f9dfc22222107dd5f8fe3e142cea8dad6bd442f087a785e')

build() {
    cmake -B build -S "cs_paint-paint-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_paint-paint-${pkgver}/src"/*.h -t "${pkgdir}/usr/include"
    install -D -m644 "cs_paint-paint-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr"/{bin/CsPaintDemo,{include,lib/cmake}/glm,lib/pkgconfig/glm.pc}
}
