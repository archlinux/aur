pkgname=Dause
pkgver=1.0.0
pkgrel=1
pkgdesc="Digital Amplified User System Environment is a retro-futuristic, minimalist terminal emulator. DAUSE includes integrated media visualization and a robust parallel tab system."
arch=('x86_64')
url="https://github.com/moyhatake/Dause"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-base' 'qtermwidget' 'fftw' 'ffmpeg')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moyhatake/Dause/archive/refs/tags/v${pkgver}.tar.gz"
        "dause.desktop")
sha256sums=('6986571ade22cf92fbc7da4d8962e5bd32fd49072ee9f3a8d677b54deb844546'
            '753a2f8e2f6d62766ef3bf0cfd41509a336624ca8994a1d784e580fe462372c9')

build() {
    cmake -B build -S "Dause-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/Dause-${pkgver}/assets/logos/isotipo.png" "${pkgdir}/usr/share/pixmaps/dause.png"
    install -Dm644 "$srcdir/dause.desktop" "${pkgdir}/usr/share/applications/dause.desktop"
}