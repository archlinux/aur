# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=lyricsx
pkgver=1.0.0
pkgrel=2
pkgdesc="free, open source, cross-platform software for editing lyrics"
url="https://github.com/timxx/lyricsx"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'qt5-multimedia' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
source=("https://github.com/timxx/lyricsx/archive/v${pkgver}.tar.gz")
sha256sums=('2fdebc7a7b2faeb56e3aeeb77f14d64573a6eb18153b53562004379bda58ec8d')

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
