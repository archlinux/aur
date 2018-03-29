pkgname=jackett
pkgver=0.8.823
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono' 'curl')
install='jackett.install'
source=("Jackett.Binaries.Mono-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.Mono.tar.gz"
        "jackett.service"
        "jackett.sysusers"
        "jackett.tmpfiles")

sha256sums=('7336e0d5c16d8d9cf115a128f08604a7fc9c079b0a9c1efbc453b1dd82f82c42'
            '75837fe04f5afd30cdbdd3349bb27b43994dc672202f886382903f7fbc92dc89'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590'
            '79ec8a9a072c3ca69556102edc50ad97fc65565d18b19ff054993a176e8e3898')

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
