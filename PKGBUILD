# Maintainer: "purplerhino" Douglas Hitchcock <clarkaddison(at)gmail(dot)com>

pkgname=sococo
pkgver=0.5.5_14531
pkgrel=2
pkgdesc="Sococo for Linux"
arch=('x86_64')
url="https://app.sococo.com/a/download"
license=('custom')

source_x86_64=(
	"https://s.sococo.com/rs/client/linux64/apt/pool/main/sococo-${pkgver//_/-}_amd64.deb"
	"sococo.desktop"
)

sha256sums_x86_64=(
	'c4439f5046d9268a0b76843fde4a8a76784875940d270c78b9d72661355bac13'
	'63073d8d182b9e24cac305222955aef6976adc4f8cfab98892d776d19fd1b367'
)

package() {
    bsdtar -O -xf "sococo-${pkgver//_/-}"*.deb data.tar.gz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/sococo/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE ${pkgdir}/usr/share/sococo/LICENSE

    # Desktop file
    install -D -m644 "sococo.desktop" "${pkgdir}/usr/share/applications/sococo.desktop"
    
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    ln -s "/usr/share/sococo/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sococo.svg"
}
