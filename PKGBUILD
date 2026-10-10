# Maintainer: CxOrg <https://github.com/ixnewton>
# Maintainer: Ian Newton <i.newton@c-org.com>
pkgname=docan-gtk-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="AI chat app with cloud and local LLM APIs: Gemini, ChatGPT, Claude, OpenRouter, Ollama, LM Studio; file attachment upload support"
arch=('x86_64')
url="https://github.com/ixnewton/docan"
license=('AGPL3')
depends=('gtk3' 'glib2' 'hicolor-icon-theme' 'libsecret' 'json-glib')
provides=('docan')
conflicts=('docan' 'docan-bin')
replaces=('docan-bin')
options=('!strip')
source=("docan-gtk-bin-${pkgver}.zip::https://github.com/ixnewton/docan/releases/download/v${pkgver}/docan-${pkgver}-2026-10-10-linux-x64.zip")
sha256sums=('a8df39a362da3fca2c0ffb76d6e580eb4429666e0bcccbfc414a2cc39942fa68')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/opt/docan"
    install -Dm755 "docan" "${pkgdir}/opt/docan/docan"
    install -d "${pkgdir}/opt/docan/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/docan/lib/"
    cp -r data "${pkgdir}/opt/docan/"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/docan.desktop" <<EOF
[Desktop Entry]
Name=Docan
Comment=Universal AI chat application
Exec=/opt/docan/docan
Icon=docan
Type=Application
Categories=Network;Chat;Utility;
Keywords=ai;chat;assistant;llm;
EOF

    if [ -f "data/flutter_assets/assets/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icon.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/docan.png"
    fi

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/docan/docan "${pkgdir}/usr/bin/docan"
}
