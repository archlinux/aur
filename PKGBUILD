# Maintainer: Aloys233 <luodh233@gmail.com>
pkgname=otomusic-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="OtoMusic - A cross-platform desktop music player"
arch=('x86_64')
url="https://github.com/Aloys233/OtoMusic"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
provides=('otomusic')
conflicts=('otomusic')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aloys233/OtoMusic/releases/download/v${pkgver}/OtoMusic-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('eb30ebae1a9a8f696c9cc2ecc26a790d242ea97490388006fad5be2405172c9d')

package() {
    cd "${srcdir}/otomusic-${pkgver}"

    # Install to /opt
    install -dm755 "${pkgdir}/opt/${pkgname%-bin}"
    cp -r . "${pkgdir}/opt/${pkgname%-bin}/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-bin}/otomusic" "${pkgdir}/usr/bin/otomusic"

    # Desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/otomusic.desktop" <<EOF
[Desktop Entry]
Name=OtoMusic
Comment=A cross-platform desktop music player
Exec=/usr/bin/otomusic %U
Icon=otomusic
Type=Application
Categories=Audio;Music;Player;AudioVideo;
EOF

    # License
    if [ -f "LICENSE.electron.txt" ]; then
        install -Dm644 LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
