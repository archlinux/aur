# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=flaresolverr-bin
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=1.2.5
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('libxcursor' 'libxcomposite' 'libxdamage' 'libxi' 'libxtst' 'atk' 'at-spi2-atk' 'libcups' 'libxss' 'libxrandr' 'libdrm' 'mesa' 'alsa-lib' 'pango' 'gtk3' )
provides=('flaresolverr')
options=('!strip')
source=("https://github.com/$__pkgname/$__pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x64.zip"
        "flaresolverr.service"
        "flaresolverr.sysusers")
sha512sums=('79e38ae3b0a0bfde5e481b163ea6a2d45e9d1ecdeb13188b7afe104d2c299aff87d1d66f0336a1c8e9beeaaa830d08cb8b46b5262c17c43d1adef3753b486fec'
            '467fdc0e665aee11e34753ede32274a350511f3a3376999f9567df44b25998648ad2392a60fc3fd301d7a24b2de90b128c8488fba11ac066a905d4f6d8b4c95a'
            '0423d10d964a187e5a153140597e7cee3a6112bf6569dfcda7848bfbce4e5660534db3bdbe4a4de9a63fbf0ecc2b874937afd94495691f76176243d2ac4b080d')

package() {
    cd "${pkgdir}"

    install -dm755 "usr/bin"
    install -dm755 "opt/${_pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    rm "${srcdir}/${_pkgname}/LICENSE"

    cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
