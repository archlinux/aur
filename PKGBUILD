# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.3.2
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
sha256sums=('331f78985f95280a88c481b2254b3e35598bc6e6892381b55ace67d0b2900ea9'
            '0070228c1e04d829d8e01e3f997dd4d9acee53fccd6ed6e1e1440b0d8aa66b74')

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
