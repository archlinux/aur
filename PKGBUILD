# Maintainer: neomoth <admin@neomoth.dev>
pkgname=ss14-starlight-launcher-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Starlight Launcher for Space Station 14"
arch=('x86_64')
url="https://github.com/ss14Starlight/Starlight.Launcher"
license=('MIT')
depends=('webkit2gtk-4.1' 'icu' 'fontconfig' 'libx11' 'libice' 'libsm')
provides=('starlight-launcher')
conflicts=('starlight-launcher')
options=('!strip' '!debug')
source=("Starlight.Launcher-linux-x64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Starlight.Launcher-linux-x64-${pkgver}.tar.gz"
        "starlight-launcher-${pkgver}.png::https://raw.githubusercontent.com/ss14Starlight/Starlight.Launcher/v${pkgver}/PublishFiles/icon.png")
noextract=("Starlight.Launcher-linux-x64-${pkgver}.tar.gz")
sha256sums=('df43cc98a49b74775a17d7abeac1eecc3549f162d810b585b14cdc6a1d33ddfa'
            '1c11bfa0cd5484c807ec2f8f0a2658e4c5383566d5050d8b6fc4ddec5a925471')

package() {
    local dest="${pkgdir}/opt/starlight-launcher"

    install -d "${dest}"
    bsdtar -xf "${srcdir}/Starlight.Launcher-linux-x64-${pkgver}.tar.gz" -C "${dest}"
    chmod +x "${dest}/Starlight.Launcher" "${dest}/loader/Robust.Loader"

    echo pacman > "${dest}/install-kind"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/starlight-launcher/Starlight.Launcher "${pkgdir}/usr/bin/starlight-launcher"

    install -Dm644 "${srcdir}/starlight-launcher-${pkgver}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/starlight-launcher.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/starlight-launcher.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Starlight Launcher
Comment=Starlight Launcher for Space Station 14
Exec=/opt/starlight-launcher/Starlight.Launcher %u
Icon=starlight-launcher
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/starlight;
DESKTOP
}
