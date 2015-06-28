# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=dnsflood
pkgver=1.20
pkgrel=1
pkgdesc="Detect abusive usage levels on high traffic nameservers and enable quick response"
arch=('i686' 'x86_64')
url="http://www.adotout.com/"
license=('GPL')
depends=('libpcap')
source=(http://www.adotout.com/$pkgname-$pkgver.tgz
        dns_flood_detector.1)
md5sums=('0bca7082210d8cb15ece64a661c7330c'
         '6f3bd91201bee4755f5bf73e300df099')

build() {
  cd "${srcdir}"/dns_flood_detector_1.2

  ./configure.pl Linux
  make
}

package() {
  cd "${srcdir}"/dns_flood_detector_1.2

  install -D -m644 "${srcdir}"/dns_flood_detector.1 \
    "${pkgdir}"/usr/share/man/man1/dns_flood_detector.1
  install -D -m755 "${srcdir}"/dns_flood_detector_1.2/dns_flood_detector \
    "${pkgdir}"/usr/bin/dns_flood_detector
}
