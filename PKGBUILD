# Maintainer: NovaDragon <me@novadeagon.space>

pkgname=godots-bin
pkgver=1.4
pkgrel=1
pkgdesc="A hub for managing your Godot versions and projects."
arch=(x86_64)
url=https://github.com/MakovWait/godots
license=(MIT)
provides=('godots')
conflicts=('godots')
options=('!strip')
depends=('unzip')
source=(
"https://github.com/MakovWait/godots/releases/download/v$pkgver.stable/LinuxX11.zip"
        "https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver.stable/LICENSE"
        "https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver.stable/icon.svg")
sha256sums=('0d7e16c526c82f147f79bf4e4f94904abc49db41d244b9e4929b2d05aa6007c7'
            '76b8e9aacad7b9b2fd0c699065186191f8705d8f1892ee36873c56f904f073ef'
            'de088f3452e04986b4988b2a22a6518a4aaaab64e808ea9eee352bea141e774a')

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
