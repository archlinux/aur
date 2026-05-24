# Maintainer: txgde-space
pkgname=musicfree-desktop-wayland-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Plug-in, customized, ad-free music player. Wayland-adapted prebuilt version."
arch=("x86_64")
url="https://github.com/txgde-space/MusicFreeDesktop"
license=("GPL")
depends=("gtk3" "nss" "alsa-lib" "libxss" "libxtst" "libxrandr" "libxkbcommon" "mesa" "hicolor-icon-theme")
options=("!strip" "!debug")

source=("MusicFree-Desktop-Linux-Wayland-x64-${pkgver}.tar.gz::https://github.com/txgde-space/MusicFreeDesktop/releases/download/${pkgver}/MusicFree-Desktop-Linux-Wayland-x64-${pkgver}.tar.gz")
sha256sums=("1ebee6e1cefea9084838cb45761eac9759f1294245d91473c2fd6b40430e06a8")

package() {
    install -d "${pkgdir}/opt/musicfree-desktop-wayland"
    cp -r --no-preserve=ownership "MusicFree-wayland-linux-x64-${pkgver}/." "${pkgdir}/opt/musicfree-desktop-wayland/"

    chmod 4755 "${pkgdir}/opt/musicfree-desktop-wayland/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
    printf '#!/bin/sh\nexec /opt/musicfree-desktop-wayland/MusicFree "$@"\n' > "${pkgdir}/usr/bin/musicfree-wayland"
    chmod 755 "${pkgdir}/usr/bin/musicfree-wayland"

    install -Dm644 "${pkgdir}/opt/musicfree-desktop-wayland/resources/res/logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/192x192/apps/musicfree-wayland.png"

    install -Dm644 "${pkgdir}/opt/musicfree-desktop-wayland/resources/res/logo.png" \
        "${pkgdir}/usr/share/pixmaps/musicfree-wayland.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/musicfree-wayland.desktop" <<EOF
[Desktop Entry]
Name=MusicFree Wayland
Comment=Plugin-based music player
Exec=musicfree-wayland %U
Icon=musicfree-wayland
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Player;
MimeType=x-scheme-handler/musicfree;
EOF
}
