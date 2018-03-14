pkgname=jackett
pkgver=0.8.749
pkgrel=3
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono' 'curl')
install='jackett.install'
source=("Jackett.Binaries.Mono-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.Mono.tar.gz"
        "jackett.service"
        "jackett.sysusers")

sha256sums=('ef27eeb95249c33ab5e4f12c103e872aa9944a842748ced62bc81a4dad2a3055'
            '75837fe04f5afd30cdbdd3349bb27b43994dc672202f886382903f7fbc92dc89'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590')

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -d -m755 "${pkgdir}/var/lib/jackett"

    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m644 "$srcdir/jackett.sysusers" "$pkgdir/usr/lib/sysusers.d/jackett.conf"
}
