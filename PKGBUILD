# Maintainer: Aloys233 <luodh233@gmail.com>
pkgname=otomusic-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="OtoMusic - A cross-platform desktop music player"
arch=('x86_64' 'aarch64')
url="https://github.com/Aloys233/OtoMusic"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
provides=('otomusic')
conflicts=('otomusic')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/Aloys233/OtoMusic/releases/download/v${pkgver}/OtoMusic-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/Aloys233/OtoMusic/releases/download/v${pkgver}/OtoMusic-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('d0014e47bede919c6cb61a63ae9734feafa4c9e0cd3436b4612619bd75249203')
sha256sums_aarch64=('ba6848879f1e46a643246778c816eb88e8c1af4dc0f308c5df1a4e2c0edcffa7')

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
