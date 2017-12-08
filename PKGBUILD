# Maintainer: Viliam Ganz <viliam.ganz@cyberhouse.sk>
# Contributor: Severus <severus@theslinux.org>

pkgname=jmeter
pkgver=3.3
pkgrel=1
arch=('any')
pkgdesc="A Java desktop application designed to load test functional behavior and measure performance"
url="http://jmeter.apache.org/"
license=("apache")
depends=("java-environment>=8")
options=('!strip')

source=("http://www.us.apache.org/dist//jmeter/binaries/apache-${pkgname}-${pkgver}.tgz"{,.asc})
md5sums=('16d2239aa3a8f496ac18e53b941d5350'
         'SKIP')
validpgpkeys=('C4923F9ABFB2F1A06F08E88BAC214CAA0612B399')
build() {
  true
}

package() {
  install -dm755 "$pkgdir/opt/jmeter" "$pkgdir/usr/bin"

  cp -a "apache-$pkgname-$pkgver"/* "$pkgdir/opt/jmeter"
  ln -s /opt/jmeter/bin/jmeter "$pkgdir/usr/bin/jmeter"
  sed -i '/^java/s|`dirname "$0"`|/opt/jmeter/bin|' "$pkgdir/opt/jmeter/bin/jmeter"

  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "/usr/bin/jmeter"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
