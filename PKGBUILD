# Maintainer: Witko <kos.na.bordel@gmail.com>
# Contributor: Stick <stick@stma.is>
# Contributor: Ngo Huy <severus@theslinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=jmeter
pkgver=5.6.2
pkgrel=1
arch=('any')
pkgdesc="Java application designed to load test functional behavior and measure performance"
url="http://jmeter.apache.org/"
license=("apache")
depends=("java-environment>=8")
options=('!strip')
source=("http://archive.apache.org/dist/jmeter/binaries/apache-${pkgname}-${pkgver}.tgz"
  "${pkgname}.desktop")
sha256sums=('08696d3b6278d272342d18609e2167ef28d2d1d5f71b592809c00bbd57cc8ef0'
  '3f039d5a34c55ce5d884bffb252cec8d88ceec367620b0ab42b201f8e45a2218')
validpgpkeys=('C4923F9ABFB2F1A06F08E88BAC214CAA0612B399')

package() {
  install -dm755 "$pkgdir/opt/jmeter" "$pkgdir/usr/bin" "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -a "apache-$pkgname-$pkgver"/* "$pkgdir/opt/jmeter"
  ln -s /opt/jmeter/bin/jmeter "$pkgdir/usr/bin/jmeter"
  sed -i '/^java/s|`dirname "$0"`|/opt/jmeter/bin|' "$pkgdir/opt/jmeter/bin/jmeter"
}

# vim:set ts=2 sw=2 et:
