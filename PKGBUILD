# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-denshi
_pkgname=seanime-denshi
pkgver=3.7.0
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration. (Denshi AppImage variant)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
depends=('fuse2')
conflicts=('seanime' 'seanime-bin')
options=('!strip')
source=(
    "https://github.com/5rahim/seanime/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage"
    "seanime-logo.png"
)
sha256sums=('3485f27c2ba32ed373817e8b5b8698aca46293d26fba04a7d772a4264b3eda72'
            '992fc7578479d919dabac766116598e67b8d82a98f4aadbe730d711e7b803a16')

package() {
    local appimage="${_pkgname}-${pkgver}_Linux_x86_64.AppImage"

    install -d "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/${appimage}" \
        "${pkgdir}/opt/${pkgname}/${appimage}"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/${appimage}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Seanime Denshi
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Type=Application
Categories=Network;Video;
Terminal=false
EOF

    install -Dm644 "${srcdir}/seanime-logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
