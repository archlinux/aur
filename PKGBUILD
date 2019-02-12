# Maintainer: "purplerhino" Douglas Hitchcock <clarkaddison(at)gmail(dot)com>

pkgname=sococo
pkgver=6.5.0_20772
pkgrel=1
pkgdesc="Sococo for Linux"
arch=('x86_64')
url="https://app.sococo.com/a/download"
license=('custom')
depends=('gconf' 'gtk2' 'libxss')
source_x86_64=(
	"https://s.sococo.com/rs/client/linux64/apt/pool/main/sococo-${pkgver//_/-}_amd64.deb"
)

sha256sums_x86_64=(
	'1169282874659b033c04316e492d3302fe965a4d990f1c1dd98fb4d86fcd9e9f'
)

package() {
    bsdtar -O -xf "sococo-${pkgver//_/-}"*.deb data.tar.gz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/sococo/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE ${pkgdir}/usr/share/sococo/LICENSE
    
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    ln -s "/usr/share/sococo/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sococo.svg"
}
