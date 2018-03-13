pkgname=jackett
pkgver=0.8.749
pkgrel=2
pkgdesc='Use many trackers with Sonarr'
arch=('any')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono' 'curl')
source=("Jackett.Binaries.Mono-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.Mono.tar.gz"
        "jackett.service"
        "jackett.sysusers")

sha256sums=('ef27eeb95249c33ab5e4f12c103e872aa9944a842748ced62bc81a4dad2a3055'
            '47326614002708a829e8ce6b7d5fc5a068125e8d64ff47fdb5f3ab09d0c4b0c8'
            'f48165d816e2b2f9a94f816e5deed58326fa23d7a3dfeaab95473899b554c6db')
install=$pkgname.install

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/opt/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett" "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -d -m755 "${pkgdir}/usr/share/Jackett"

    install -Dm644 "$srcdir/jackett.sysusers" "$pkgdir/usr/lib/sysusers.d/jackett.conf"
}
