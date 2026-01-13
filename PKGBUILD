pkgname=dause
pkgver=1.0.1
pkgrel=1
pkgdesc="Digital Amplified User System Environment is a retro-futuristic, minimalist terminal emulator. DAUSE includes a virtual keyboard, media visualization and a robust parallel tab system."
arch=('x86_64')
url="https://github.com/moyhatake/Dause"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-base' 'qtermwidget' 'fftw' 'ffmpeg')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moyhatake/Dause/archive/refs/tags/v${pkgver}.tar.gz"
        "dause.desktop")
sha256sums=('7c05b6820147a0ce4147284ed07e49d3fa8b1a71b564a9138afe0443b073a819'
            'd511fb664be148dbd52b77037b4367cf97a12d36b8add9064975946005b9da12')

build() {
    cmake -B build -S "Dause-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/Dause-${pkgver}/assets/logos/isotipo.png" "${pkgdir}/usr/share/pixmaps/dause.png"
    install -Dm644 "$srcdir/dause.desktop" "${pkgdir}/usr/share/applications/dause.desktop"
}
