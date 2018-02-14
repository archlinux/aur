# Maintainer: Witko <kos.na.bordel@gmail.com>
# Contributor: Ngo Huy <severus@theslinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Nathaniel Stickney <nstickney@gmail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=jmeter
pkgver=4.0
pkgrel=1
arch=('any')
pkgdesc="Java application designed to load test functional behavior and measure performance"
url="http://jmeter.apache.org/"
license=("apache")
depends=("java-environment>=8")
options=('!strip')
source=("http://www.us.apache.org/dist/jmeter/binaries/apache-${pkgname}-${pkgver}.tgz" "${pkgname}.desktop")
sha512sums=('eee7d68bd1f7e7b269fabaf8f09821697165518b112a979a25c5f128c4de8ca6ad12d3b20cd9380a2b53ca52762b4c4979e564a8c2ff37196692fbd217f1e343' '6379c230a3b2a61539eec5c9cbc18babfc927cdfbb9468d46ff0334b64fccf1cbf5cba0f351d9a871c68a98e3bf1f9c22a992434bc4ffcc2743c185be93bb318')
validpgpkeys=('C4923F9ABFB2F1A06F08E88BAC214CAA0612B399')

package() {
  install -dm755 "$pkgdir/opt/jmeter" "$pkgdir/usr/bin" "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -a "apache-$pkgname-$pkgver"/* "$pkgdir/opt/jmeter"
  ln -s /opt/jmeter/bin/jmeter "$pkgdir/usr/bin/jmeter"
  sed -i '/^java/s|`dirname "$0"`|/opt/jmeter/bin|' "$pkgdir/opt/jmeter/bin/jmeter"
}

# vim:set ts=2 sw=2 et:
