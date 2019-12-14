# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=lyricsx
pkgver=1.1.0
pkgrel=1
pkgdesc="free, open source, cross-platform software for editing lyrics"
url="https://github.com/timxx/lyricsx"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'qt5-multimedia' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
source=("https://github.com/timxx/lyricsx/archive/v${pkgver}.tar.gz")
sha256sums=('a9ea959e815eb35a1a2b6517b2d23fa785a2a024c0f8076aa422ed7af4ff3b37')

prepare() {
    mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install
}
