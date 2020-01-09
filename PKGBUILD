# Maintainer: Tun Win Naing <tunwn.mdy@gmail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-armv6-bin
pkgver=0.12.1494
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('i686' 'arm' 'armv6h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono' 'curl' 'openssl-1.0')
options=('!strip' 'staticlibs')
conflicts=('jackett')

install='jackett.install'
source=("jackett.service"
        "jackett.sysusers"
        "jackett.tmpfiles")

source=("Jackett.Binaries.Mono-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.Mono.tar.gz")

sha256sums=('2ce90ef7a16cafb7d37e39cfb4463783f6bb992b6ac8a74d5ff6867cfcf5f32f')

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/../jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/../jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/../jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
