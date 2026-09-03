# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# COntributor: Ilan Frumer (ilanfrumer@gmail.com)

_appname=dragonfly
_appauthor=dragonflydb
pkgname=${_appname}-bin
pkgver=1.40.2
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
sha256sums_x86_64=('2430bedbac68bba45c0cf2e53c7d4a4702e0950ad020d142655b8ed2745c73e6')
sha256sums_aarch64=('6999870a8c9c5b6f6594494d2ecd25a58c7360236365f545873669ce3058c454')

package() {
    install -Dm755 "${_appname}-${CARCH}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

    install -Dm644 "${_appname}.conf" "${pkgdir}/etc/${_appname}/${_appname}.conf"

    install -Dm644 "${_appname}.logrotate" "${pkgdir}/etc/logrotate.d/${_appname}"

    install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"
    install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
    install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"
}
