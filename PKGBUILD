# Maintainer: wituz
pkgname=saphi-bin
pkgver=0.0.7.0.0.0.7.0beta
pkgrel=1
pkgdesc="Leaderboard and time-trial tracking client for Crash Team Racing custom tracks"
arch=('x86_64')
url="https://5ever.crashteamranking.com/"
license=('unknown')
depends=('glibc' 'gcc-libs' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libgl' 'alsa-lib')
provides=('saphi')
conflicts=('saphi')
options=('!strip')
source=("SaphiClient-${pkgver}.tar.gz::https://github.com/Project-Saphi/Saphi/releases/latest/download/SaphiClient-duck-release-static-linux-x64.tar.gz"
        "saphi.desktop")
sha256sums=('SKIP'  # Checksum changes with each release; using /latest/ URL
            'e5ccdd99dfb2a4a0ee876072eb3c6a13f5be15ae0834910d7520abf33bc89834')

package() {
    cd "${srcdir}/Saphi"

    # Install main application
    install -dm755 "${pkgdir}/opt/saphi"
    cp -r Client/* "${pkgdir}/opt/saphi/"

    # Make executable
    chmod +x "${pkgdir}/opt/saphi/Client"

    # Install icon
    install -Dm644 Client/data/wheel_icon.png "${pkgdir}/usr/share/pixmaps/saphi.png"

    # Install desktop file
    install -Dm644 "${srcdir}/saphi.desktop" "${pkgdir}/usr/share/applications/saphi.desktop"

    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/saphi/Client "${pkgdir}/usr/bin/saphi"
}
