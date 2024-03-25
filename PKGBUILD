# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.3.1
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
sha256sums=('47fe99d30459cfdb46cc29a17b6979f08e7cf3239b125869e974da53eac221d2'
            '6bda18b22ae320afc038922035007a87c503b275f34695179fe8e9439f5f5991')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i ../use-local-taglib.patch
}

build() {
    cd "${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -B build
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE*  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
