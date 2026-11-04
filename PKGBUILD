# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# COntributor: Ilan Frumer (ilanfrumer@gmail.com)

_appname=dragonfly
_appauthor=dragonflydb
pkgname=${_appname}-bin
pkgver=2.1
pkgrel=1
pkgdesc="Dragonfly is a modern in-memory datastore, fully compatible with Redis and Memcached APIs"

arch=("x86_64" "aarch64")
license=('custom:BSL1.1')
url="https://${_appauthor}.io/"

depends=('zlib' 'glibc')

backup=('etc/dragonfly/dragonfly.conf')

source=("${_appname}.conf"
        "${_appname}.logrotate"
        "${_appname}.service"
        "${_appname}.sysusers"
        "${_appname}.tmpfiles")
source_x86_64=("${_appname}-${pkgver}-${arch[0]}.tgz::https://github.com/${_appauthor}/${_appname}/releases/download/v${pkgver}/${_appname}-${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${pkgver}-${arch[1]}.tgz::https://github.com/${_appauthor}/${_appname}/releases/download/v${pkgver}/${_appname}-${arch[1]}.tar.gz")
sha256sums=('148d8c6c9981b82f66f3c53f3a6f99b4190fe47fe35db6303d0f28bfe2ade547'
            '438e9e6c26949735bee90df63da748c70fc948199031084c8fdae86ac6e7b7ab'
            'ac7e5bfbf6e33de1140e1804374ca1e01c2b86215daf75b532d00bcdc04355ee'
            '1fc7b7cd3da8d9efc427b78116274a5c801feb5652b86a339521c2ab729e19be'
            'c2390e6ea09e629450946fb2c8b9875c447e7034c5174dd3e0286d6f9410003b')
sha256sums_x86_64=('99c4abdfb0f08de9b228e6bea943ba549e7432ac58386279d6ae08b845f31ae5')
sha256sums_aarch64=('174ead1433c5a6cef306a767163d5d5837bd024f64c10d5a0e0206ea2746d1ac')

package() {
    install -Dm755 "${_appname}-${CARCH}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

    install -Dm644 "${_appname}.conf" "${pkgdir}/etc/${_appname}/${_appname}.conf"

    install -Dm644 "${_appname}.logrotate" "${pkgdir}/etc/logrotate.d/${_appname}"

    install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"
    install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
    install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"
}
