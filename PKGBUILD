# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=flaresolverr-bin
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=1.2.9
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('libxcursor' 'libxcomposite' 'libxdamage' 'libxi' 'libxtst' 'atk' 'at-spi2-atk' 'libcups' 'libxss' 'libxrandr' 'libdrm' 'mesa' 'alsa-lib' 'pango' 'gtk3' )
provides=('flaresolverr')
options=('!strip')
source=("https://github.com/$__pkgname/$__pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x64.zip"
        "flaresolverr.sysusers")
sha512sums=('8c2b619397233a8f6ccda6e1a51b4e09e6df01947ef7d95236b6b7f6d0cc23b5718f9e9c8e6649f7933d7520fb0afecbe241913e648324da4e979a10ae0f2b83'
            '0423d10d964a187e5a153140597e7cee3a6112bf6569dfcda7848bfbce4e5660534db3bdbe4a4de9a63fbf0ecc2b874937afd94495691f76176243d2ac4b080d')

package() {
    cd "${pkgdir}"

    install -dm755 "usr/bin"
    install -dm755 "opt/${_pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    rm "${srcdir}/${_pkgname}/LICENSE"

    install -Dm644 "${srcdir}/${_pkgname}/flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    rm "${srcdir}/${_pkgname}/flaresolverr.service"

    cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
