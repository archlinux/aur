# Maintainer: Allddd <allddd (at) proton (dot) me>

pkgname=tuptime
pkgver=5.2.2
pkgrel=1
pkgdesc='Historical and statistical system uptime reporting'
arch=('any')
url='https://github.com/rfmoz/tuptime'
license=('GPL2')
depends=('python')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2db03803f3d44c2d4a4bba424eb6cc392092c63a6a281c003adb9bdeb4c57f55')
install=${pkgname}.install

prepare() {
    cd ${pkgname}-${pkgver}/src/systemd/
    sed -ni '1p' tuptime.sysusers
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 "src/tuptime" "${pkgdir}/usr/bin/tuptime"
    install -Dm644 "src/systemd/tuptime.sysusers" "${pkgdir}/usr/lib/sysusers.d/tuptime.conf"
    install -Dm644 "src/systemd/tuptime.service" "${pkgdir}/usr/lib/systemd/system/tuptime.service"
    install -Dm644 "src/systemd/tuptime-sync.timer" "${pkgdir}/usr/lib/systemd/system/tuptime-sync.timer"
    install -Dm644 "src/systemd/tuptime-sync.service" "${pkgdir}/usr/lib/systemd/system/tuptime-sync.service"
    install -Dm644 "src/man/tuptime.1" "${pkgdir}/usr/share/man/man1/tuptime.1"
    install -Dm644 "tuptime-manual.txt" "${pkgdir}/usr/share/doc/${pkgname}/tuptime-manual.txt"
}

# vim: ts=4 sw=4 et:
