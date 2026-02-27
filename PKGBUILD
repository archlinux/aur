# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=dosbox-pure-unleashed-bin
pkgver=1.0_preview5
pkgrel=1
pkgdesc="DOSBox reimagined with a friendly interface, ZIP loading and save states"
arch=('x86_64')
url="https://github.com/schellingb/dosbox-pure-unleashed"
license=('GPL2')
depends=('libgl' 'libx11')
provides=('dosbox-pure-unleashed')
conflicts=('dosbox-pure-unleashed' 'dosbox-pure-unleashed-git')
options=('!strip')
_pkgver="${pkgver//_/-}"
# Temporarily adding 'fix' suffix
source=("dosbox-pure-unleashed-${pkgver}.zip::https://github.com/schellingb/dosbox-pure-unleashed/releases/download/${_pkgver}/dosbox_pure_unleashed-linux-x64-${_pkgver}fix.zip"
        "dosbox-pure-unleashed.png"
        "LICENSE::https://github.com/schellingb/dosbox-pure-unleashed/raw/main/LICENSE")
sha256sums=('45d99ba48b21e2c8f7161b64bb779736de36244f4a20dd5f82fd41b0861c909c'
            'dbc60121b55da42d2f4f2f19b92bc741d073be313d28a16699572ce3942a89dc'
            '61e0922747762a12e88a47ab66ef4ed026148361900440086b4863145973a374')

package() {
    cd "${srcdir}"

    install -Dm755 DOSBoxPure "${pkgdir}/usr/bin/dosbox-pure-unleashed"

    install -Dm644 "${srcdir}/dosbox-pure-unleashed.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dosbox-pure-unleashed.png"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat <<'EOF' > "${pkgdir}/usr/share/applications/dosbox-pure-unleashed.desktop"
[Desktop Entry]
Name=DOSBox Pure Unleashed
Comment=DOS emulator with friendly UI, ZIP loading and save states
Exec=dosbox-pure-unleashed
Terminal=false
Type=Application
Categories=Game;Emulator;
Icon=dosbox-pure-unleashed
EOF
}
