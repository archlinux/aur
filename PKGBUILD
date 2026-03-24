# Maintainer: krmmyvz <https://github.com/krmmyvz>
pkgname=vibestreamer
pkgver=1.3.3
pkgrel=1
pkgdesc='Modern IPTV player with Xtream Codes and M3U support, built with Qt6 and libmpv'
arch=('x86_64')
url='https://github.com/krmmyvz/vibestreamer'
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'mpv' 'zlib')
makedepends=('cmake' 'gcc' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/krmmyvz/vibestreamer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('551ae70c5336b8fa966be074dc2c6e1ca9ffb139d7e4f6ad667a0b62758dcaf7')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    cd "${pkgname}-${pkgver}"

    # Desktop entry
    install -Dm644 flatpak/io.github.krmmyvz.Vibestreamer.desktop \
        "${pkgdir}/usr/share/applications/vibestreamer.desktop"

    # Icon
    install -Dm644 logo_concept1.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vibestreamer.svg"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
