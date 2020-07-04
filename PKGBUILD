# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=lyricsx
pkgver=1.1.1
pkgrel=2
pkgdesc="free, open source, cross-platform software for editing lyrics"
url="https://github.com/timxx/lyricsx"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'qt5-multimedia' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
source=("https://github.com/timxx/lyricsx/archive/v${pkgver}.tar.gz")
sha256sums=('46d7c2c237e5f4f2e2a9233ff9132a8650342ec6b2fbd438e8103b4ac45a5686')

prepare() {
    mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLRCX_WARN_AS_ERROR=OFF \
        "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install
}
