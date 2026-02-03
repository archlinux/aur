# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-paint
pkgver=1.1.1
pkgrel=1
pkgdesc='Library for abstraction of the Vulkan API'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
depends=(
    'gcc-libs'
    'glibc'
    'vulkan-icd-loader')
makedepends=(
    'cmake'
    'glm'
    'glslang'
    'vulkan-headers')
options=('!emptydirs')
source=("https://github.com/copperspice/cs_paint/archive/paint-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e56d599feaa8b2de69dd01e03b5b1e3f70ace725bcfb8d5c285f8c039f078850')

build() {
    cmake -B build -S "cs_paint-paint-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_paint-paint-${pkgver}/src"/*.h -t "${pkgdir}/usr/include"
    install -D -m644 "cs_paint-paint-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr"/{bin/CsPaintDemo,{include,lib/cmake}/glm,lib/pkgconfig/glm.pc}
}
