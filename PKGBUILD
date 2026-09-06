# Maintainer: rez <rez@ifwerez.ru>
pkgname=cider-studio-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="run & control roblox studio advancedly on linux (pre-built binary)"
arch=('x86_64')
url="https://ifwerez.ru/git/rez/cider"
license=('MIT')
depends=('sdl2' 'libgl' 'zlib' 'xz' 'curl' 'cabextract' 'wine')
source=("https://ifwerez.ru/git/rez/cider/releases/download/${pkgver}/cider-${pkgver}-linux-x86_64"
        "cider.png::https://ifwerez.ru/git/rez/cider/raw/branch/main/src/resources/cider.png")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 "cider-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/cider"

    install -Dm644 cider.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cider.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/cider.desktop" <<EOF
[Desktop Entry]
Name=Cider
Comment=run & control roblox studio advancedly on linux
Exec=cider %U
Type=Application
Icon=cider
Categories=Game;Development;
StartupWMClass=cider
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/roblox-studio.desktop" <<EOF
[Desktop Entry]
Name=Roblox Studio
Comment=guess what this is
Exec=cider %U
Type=Application
Icon=cider
Categories=Game;Development;
MimeType=application/x-roblox-rbxl;application/x-roblox-rbxlx;application/x-roblox-rbxm;application/x-roblox-rbxmx;x-scheme-handler/roblox-studio;x-scheme-handler/roblox-studio-auth;
StartupWMClass=RobloxStudioBeta.exe
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/mime/packages/cider-mimetypes.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-roblox-rbxl"><comment>Roblox Place</comment><glob pattern="*.rbxl"/></mime-type>
  <mime-type type="application/x-roblox-rbxlx"><comment>Roblox Place XML</comment><glob pattern="*.rbxlx"/></mime-type>
  <mime-type type="application/x-roblox-rbxm"><comment>Roblox Model</comment><glob pattern="*.rbxm"/></mime-type>
  <mime-type type="application/x-roblox-rbxmx"><comment>Roblox Model XML</comment><glob pattern="*.rbxmx"/></mime-type>
</mime-info>
EOF
}
 
