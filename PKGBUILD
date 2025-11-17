# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# COntributor: Ilan Frumer (ilanfrumer@gmail.com)

_appname=dragonfly
pkgname=${_appname}-bin
pkgver=1.35.0
pkgrel=1
pkgdesc="Dragonfly is a modern in-memory datastore, fully compatible with Redis and Memcached APIs"
arch=("x86_64" "aarch64")
url="https://dragonflydb.io/"
license=('custom:BSL1.1')
depends=('zlib' 'glibc')
backup=('etc/dragonfly/dragonfly.conf')
source=("https://github.com/dragonflydb/${_appname}/releases/download/v${pkgver}/${_appname}-${arch}.tar.gz"
        "${_appname}.conf"
        "${_appname}.logrotate"
        "${_appname}.service"
        "${_appname}.sysusers"
        "${_appname}.tmpfiles")
sha256sums=('de16bbd4867227e700ab4dceaafd949c3490303718413eff8597f2291c8ac50e'
            '148d8c6c9981b82f66f3c53f3a6f99b4190fe47fe35db6303d0f28bfe2ade547'
            '438e9e6c26949735bee90df63da748c70fc948199031084c8fdae86ac6e7b7ab'
            'ac7e5bfbf6e33de1140e1804374ca1e01c2b86215daf75b532d00bcdc04355ee'
            '1fc7b7cd3da8d9efc427b78116274a5c801feb5652b86a339521c2ab729e19be'
            'c2390e6ea09e629450946fb2c8b9875c447e7034c5174dd3e0286d6f9410003b')

package() {
    install -Dm755 "${_appname}-${CARCH}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

    install -Dm644 "${_appname}.conf" "${pkgdir}/etc/${_appname}/${_appname}.conf"

    install -Dm644 "${_appname}.logrotate" "${pkgdir}/etc/logrotate.d/${_appname}"

    install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"
    install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
    install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"
}
