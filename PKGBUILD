# Maintainer: NovaDragon <me@novadeagon.space>

pkgname=godots-bin
pkgver=1.3.stable
pkgrel=1
pkgdesc="A hub for managing your Godot versions and projects."
arch=(x86_64)
url=https://github.com/MakovWait/godots
license=(MIT)
provides=('godots')
options=('!strip')
source=(
"https://github.com/MakovWait/godots/releases/download/v$pkgver/LinuxX11.zip"
        "https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/icon.svg")
sha256sums=('141d4d7244691fdedae7994d45b2f4610d1604190fbbb61f93ffccc284f8d29f'
            '76b8e9aacad7b9b2fd0c699065186191f8705d8f1892ee36873c56f904f073ef'
            'eb84abebbcbed00e25d5c7b82162fc461d6968c0c9e07b8913faf5525f693295')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"

    install -Dm755 "Godots.x86_64" "${pkgdir}/opt/${pkgname}/godots"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D icon.svg "${pkgdir}/usr/share/icons/godots.svg"

    ln -s "/opt/${pkgname}/godots" "${pkgdir}/usr/bin/godots"

    cat > ${pkgdir}/usr/share/applications/godots.desktop << EOF
[Desktop Entry]
Name=Godots
Exec=godots
Terminal=false
Type=Application
Icon=godots
Comment=A hub for managing your Godot versions and projects.
Categories=Game;Development;
EOF
}
