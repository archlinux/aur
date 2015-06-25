# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Yann Lopez <arch at lonewulf dot net>
pkgname=ahcpd
pkgver=0.53
pkgrel=5
pkgdesc="The Ad-Hoc Configuration Protocol daemon"
arch=('i686' 'x86_64')
url="http://www.pps.univ-paris-diderot.fr/~jch/software/ahcp/"
license=('custom')
depends=('bash')
backup=('etc/ahcpd.conf')
source=("http://www.pps.univ-paris-diderot.fr/~jch/software/files/$pkgname-$pkgver.tar.gz"
        "ahcpd.conf"
        "ahcpd@.service")
md5sums=('a1a610bf20965aa522cd766bf3d5829a'
         'a18e5f236d3100a0d94b4c73bef5c193'
         'd0c133f83f2f49e2adcf8df420f845d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="/usr" TARGET="$pkgdir" install

  install -Dm644 ../ahcpd.conf "${pkgdir}"/etc/ahcpd.conf
  install -Dm644 ../ahcpd@.service "${pkgdir}"/usr/lib/systemd/system/ahcpd@.service

  install -dm755 "${pkgdir}"/var/lib/ahcpd-leases/

  # Install custom license
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/"
}
