# Maintainer: "purplerhino" Douglas Hitchcock <clarkaddison(at)gmail(dot)com>

pkgname=sococo
pkgver=0.5.1_12881
pkgrel=1
pkgdesc="Sococo for Linux"
arch=('x86_64')
url="https://app.sococo.com/a/download"
license=('custom')

source_x86_64=("https://s.sococo.com/rs/client/linux64/apt/pool/main/sococo-${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('fa3e33bef7282cd922424d0fe3f3aea3cae66bc83117410670899eb727c7ce78')

package() {
    bsdtar -O -xf "sococo-${pkgver//_/-}"*.deb data.tar.gz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/sococo/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE ${pkgdir}/usr/share/sococo/LICENSE
}
