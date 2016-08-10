# Maintainer: "purplerhino" Douglas Hitchcock <clarkaddison(at)gmail(dot)com>

pkgname=sococo
pkgver=0.3.9_10415
pkgrel=1
pkgdesc="Sococo for Linux"
arch=('x86_64')
url="https://app.sococo.com/a/download"
license=('custom')

source_x86_64=("https://s.sococo.com/rs/client/linux64/apt/pool/main/sococo-${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('eec10c2b2527a0b4834092794497bbda5464a64d7922bd39cd4fde2fc749df44')

package() {
    bsdtar -O -xf "sococo-${pkgver//_/-}"*.deb data.tar.gz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/sococo/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE ${pkgdir}/usr/share/sococo/LICENSE
}
