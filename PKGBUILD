# Maintainer: Tandang Pangestu <jpangestu111@gmail.com>
pkgname=nordplayer-bin
pkgver=0.1.16.alpha
_realver=0.1.16-alpha # The actual upstream package version
pkgrel=1
pkgdesc="A highly customizable music player with extensive theming"
arch=('x86_64')
url="https://github.com/jpangestu/nordplayer"
license=('MIT')
depends=('gtk3' 'glibc' 'mpv' 'ffmpeg')
provides=('nordplayer')
conflicts=('nordplayer')

source=("nordplayer-${_realver}-linux.tar.gz::${url}/releases/download/v${_realver}/nordplayer-${_realver}-linux.tar.gz"
        "nordplayer.desktop"
        "nordplayer_icon.svg"
        "LICENSE-${_realver}::https://raw.githubusercontent.com/jpangestu/nordplayer/v${_realver}/LICENSE")

sha256sums=('f5e32be26f4c4df81d09e0bca25f5e70653232aee4683c52fcf66405adbc28cf'
            'e5adb6c1b3d616480b37203b61df0985c5bb946af5cd35711d63423da8156789'
            'ad3b60b31216cc4b48e7f69cb2654c51c433a255744b29b5c61153b141f0e717'
            'd2d008fce1bf600da89fa17ca86a1beb8abb3f3a54121494684035dbf275d9cb')

package() {
    # Install the main app files to /opt
    install -d "${pkgdir}/opt/nordplayer"

    # Explicitly copy only the app files, safely ignoring the downloads/icons
    cp -r "${srcdir}/data" "${pkgdir}/opt/nordplayer/"
    cp -r "${srcdir}/lib" "${pkgdir}/opt/nordplayer/"
    cp "${srcdir}/nordplayer" "${pkgdir}/opt/nordplayer/"

    chmod +x "${pkgdir}/opt/nordplayer/nordplayer"

    # Create the terminal shortcut
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/nordplayer/nordplayer" "${pkgdir}/usr/bin/nordplayer"

    # Install the .desktop file
    install -Dm644 "${srcdir}/nordplayer.desktop" "${pkgdir}/usr/share/applications/nordplayer.desktop"

    # Install the icon
    install -Dm644 "${srcdir}/nordplayer_icon.svg" "${pkgdir}/usr/share/pixmaps/nordplayer_icon.svg"

    # Install the license file into the required Arch directory
    install -Dm644 "${srcdir}/LICENSE-${_realver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
