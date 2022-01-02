# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=flaresolverr-bin
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=2.1.0
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('alsa-lib' 'at-spi2-atk' 'atk' 'dbus-glib' 'gtk3' 'libcups' 'libdrm' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxi' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'pango')
provides=('flaresolverr')
options=('!strip')
source=("https://github.com/$__pkgname/$__pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x64.zip"
        "flaresolverr.sysusers"
        "flaresolverr.tmpfiles")
sha512sums=('f2b2a22d9142ae023cf03a016854efd7be474a7eb70548f843e9ab53cb96dda3ba6947aa5b8efb4085c77d853adbd79bd1f7c1dbf8455ce8e33f4cfaebe39c5e' 
            '0423d10d964a187e5a153140597e7cee3a6112bf6569dfcda7848bfbce4e5660534db3bdbe4a4de9a63fbf0ecc2b874937afd94495691f76176243d2ac4b080d'
            '32d51968f2f704c06eff119c6a7fd2f4f731cad2665aa1db245660709b376d9e974b59239ef4e33efd817775678fefde6ac48c3ed2c6b4b6921a06a06007a255')

package() {
    cd "${pkgdir}"

    install -dm755 "usr/bin"
    install -dm755 "opt/${_pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    rm "${srcdir}/${_pkgname}/LICENSE"

    install -Dm644 "${srcdir}/${_pkgname}/flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    rm "${srcdir}/${_pkgname}/flaresolverr.service"

    cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"

    chown -R flaresolverr:flaresolverr "${pkgdir}/opt/${_pkgname}"

    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${srcdir}/flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
