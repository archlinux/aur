# Maintainer: RedTide <redtid3@gmail.com>

pkgname="sfizz"
pkgver=0.2.0
pkgrel=1
pkgdesc="SFZ library and LV2 plugin"
url="https://sfz.tools/sfizz"
arch=('x86_64')
license=('custom:BSD-2-Clause' 'custom:ISC')
makedepends=('git' 'cmake')
depends=('libsndfile' 'jack')
conflicts=('sfizz-git')
source=("https://github.com/sfztools/sfizz/releases/download/v${pkgver}/sfizz-v${pkgver}-src.tar.gz")
sha256sums=('82ec049cc90abd8e1850992a831e1ce7369210548e60a020511c98eb13ef76f4')
build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" "${srcdir}/${pkgname}-v${pkgver}"
    cmake --build . --target all
}
package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/${pkgname}-v${pkgver}/build" --target install
    install -Dm644 "${srcdir}/${pkgname}-v${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
