# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# COntributor: Ilan Frumer (ilanfrumer@gmail.com)

_appname=dragonfly
pkgname=${_appname}-bin
pkgver=1.27.2
pkgrel=2
pkgdesc="Dragonfly is a modern in-memory datastore, fully compatible with Redis and Memcached APIs"
arch=("x86_64" "aarch64")
url="https://dragonflydb.io/"
license=('custom:BSL1.1')
depends=('zlib' 'glibc')
source=("https://github.com/dragonflydb/${_appname}/releases/download/v${pkgver}/${_appname}-${arch}.tar.gz"
        "${_appname}.conf"
        "${_appname}.logrotate"
        "${_appname}.service"
        "${_appname}.sysusers"
        "${_appname}.tmpfiles")
sha256sums=('55c028f04c16067bc2b57b02f12cf08468b8270277b7346c384af4e7954f941f'
            '6fa27e3e67ace5894d3841a714976345880e7d2018a7ae0ccfccc4e55d577bc4'
            '438e9e6c26949735bee90df63da748c70fc948199031084c8fdae86ac6e7b7ab'
            '3ba679c817878363031f87f0778bedc65bf57a445fd4761133b2454a514aa2c0'
            '1fc7b7cd3da8d9efc427b78116274a5c801feb5652b86a339521c2ab729e19be'
            '167daaed78362c1ce9846760f7d77bb8dffb3c97b73aa8eee762ea655030805b')

package() {
    install -Dm755 "${_appname}-${CARCH}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

    install -Dm644 "${_appname}.conf" "${pkgdir}/etc/${_appname}/${_appname}.conf"

    install -Dm644 "${_appname}.logrotate" "${pkgdir}/etc/logrotate.d/${_appname}"

    install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"
    install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
    install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"
}
