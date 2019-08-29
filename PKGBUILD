# Maintainer: Aleksandr <contact at via dot aur>
pkgname=nftables-geoip-sets-git
pkgver=r25.e1b73b8
pkgrel=1
pkgdesc="GeoIP Database for nftables"
arch=('any')
license=('GPL-3.0')
url="https://github.com/chr0mag/geoipsets"
install='install'
source=('nftables-geoip-sets::git+git://github.com/chr0mag/geoipsets.git')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    cd "${srcdir}/${pkgname%-git}"
    sed -i 's|/usr/local/share|/usr/share|' maxmindupdate.service
    sed -i 's|/usr/local/bin|/usr/lib/systemd/scripts|' maxmindupdate.service
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -d -m 755 "${pkgdir}"/usr/share/geoipsets
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    install -Dm750 -t "${pkgdir}/usr/lib/systemd/scripts" build-country-sets.sh
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" maxmindupdate.service
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" maxmindupdate.timer
}
md5sums=('SKIP')
