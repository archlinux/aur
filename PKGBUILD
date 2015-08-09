# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=fierce
pkgver=1.0.3
pkgrel=1
pkgdesc="Domain DNS scanner script"
arch=('any')
url="http://ha.ckers.org/fierce/"
license=(unknown)
depends=('perl' 'perl-net-dns')
source=("http://dev.pentoo.ch/~grimmlin/distfiles/fierce.pl"
        "http://dev.pentoo.ch/~grimmlin/distfiles/hosts.txt")
sha1sums=('46fa2ebc416c30f414bd0cd86b9f4577382c46a4'
          'a3d3001e93c171928ce61eb7e3704dca6cb10887')
build() {
  # Add path to global hosts.txt in /etc/fierce/hosts.txt
  sed -i -e "s|'hosts.txt';|'/etc/fierce/hosts.txt';|" \
         -e "/open (WORDLIST, '<', 'hosts.txt') or/a\ \ \ \ open (WORDLIST, '<', '/etc/fierce/hosts.txt') or" "$srcdir"/fierce.pl
}
package() {
  install -D -m755 "$srcdir"/fierce.pl "$pkgdir"/usr/bin/fierce.pl
  install -D -m644 "$srcdir"/hosts.txt "$pkgdir"/etc/fierce/hosts.txt
}
