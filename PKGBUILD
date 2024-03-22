# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.3.0
pkgrel=1
pkgdesc="Convert Netease Cloud Music ncm files to mp3/flac files."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/taurusxin/${pkgname}"
license=("MIT")
depends=("taglib")
makedepends=("cmake" "taglib")
provides=("${pkgname}"{,-latest-bin} )
conflicts=("${pkgname}"{,-latest-bin})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "use-local-taglib.patch")
sha256sums=('e00a94129cc8c9b9c211d74157c533bac8a78180b534c93cfad2544e639f068a'
            '065b9ef5d764ee0f10c1a9049e9c0ef7430674fdfc3c06959b3bc38654121052')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i ../use-local-taglib.patch
}

build() {
    cd "${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -B build
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    cmake --install build
    install -Dm644 LICENSE*  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
