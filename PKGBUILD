# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy dot co dot uk>
# Contributor: K4YT3X <aur@k4yt3x.com>
pkgname=etesync-dav-bin
pkgver=0.35.1
pkgrel=1
pkgdesc='A CalDAV and CardDAV adapter for EteSync'
arch=('x86_64')
url='https://github.com/etesync/etesync-dav'
license=('GPL-3.0-or-later')
depends=(glibc zlib)
provides=('etesync-dav')
conflicts=('etesync-dav')
source=("etesync-dav-${pkgver}.zip::${url}/releases/download/v${pkgver}/dist-ubuntu-latest.zip"
        "etesync-dav@.service.${pkgver}::https://raw.githubusercontent.com/etesync/etesync-dav/v${pkgver}/examples/systemd-sandbox/etesync-dav@.service"
        "etesync-dav.service.${pkgver}::https://raw.githubusercontent.com/etesync/etesync-dav/v${pkgver}/examples/systemd-user/etesync-dav.service")
b2sums=('aa39410654aa306daca048100a7f553f4adf6cd0b4bd103654e93c4c91f3040c1c81f1ce13c32c092b738eb5e3f589691206e94d5c17c64da453586ba74f9350'
        '312589c5276bb06c1918d9b9d4f345112ea344e257cbaf5a38da9fd9cba5295d3d977def858dcb42e1b18b1783abe0e92ac42974136eaf58fdc0831a4d97deac'
        '2a64875a008414065bd2b3e88a989900ad571f00a7f6e95d68ab298ab1905333668ec2fe835494f5f084419e4b64baf23cf566e1f914508f5c8264074e198a67')

package() {
    install -Dm 755 linux-amd64-etesync-dav "${pkgdir}/usr/bin/etesync-dav"

    mkdir -p "${pkgdir}/usr/lib/systemd/user/"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ../etesync-dav.service.${pkgver} "${pkgdir}/usr/lib/systemd/user/etesync-dav.service"
    install -Dm 644 ../etesync-dav@.service.${pkgver} "${pkgdir}/usr/lib/systemd/system/etesync-dav@.service"
}
