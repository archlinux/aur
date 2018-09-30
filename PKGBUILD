# Maintainer: Witko <kos.na.bordel@gmail.com>
# Contributor: Ngo Huy <severus@theslinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Nathaniel Stickney <nstickney@gmail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=jmeter
pkgver=5.0
pkgrel=1
arch=('any')
pkgdesc="Java application designed to load test functional behavior and measure performance"
url="http://jmeter.apache.org/"
license=("apache")
depends=("java-environment>=8")
options=('!strip')
source=("http://www.us.apache.org/dist/jmeter/binaries/apache-${pkgname}-${pkgver}.tgz" "${pkgname}.desktop")
sha512sums=('a5a3bdd84ec8f78b67cee1b12bd9f2f578f3e9334ef2dc85cebd37878e0cf69ea3385a9c4f531dae094c0a4df93f262f43c2d9a9dfb10d38565d17eec3f907f1'
            '6379c230a3b2a61539eec5c9cbc18babfc927cdfbb9468d46ff0334b64fccf1cbf5cba0f351d9a871c68a98e3bf1f9c22a992434bc4ffcc2743c185be93bb318')
validpgpkeys=('C4923F9ABFB2F1A06F08E88BAC214CAA0612B399')

package() {
  install -dm755 "$pkgdir/opt/jmeter" "$pkgdir/usr/bin" "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -a "apache-$pkgname-$pkgver"/* "$pkgdir/opt/jmeter"
  ln -s /opt/jmeter/bin/jmeter "$pkgdir/usr/bin/jmeter"
  sed -i '/^java/s|`dirname "$0"`|/opt/jmeter/bin|' "$pkgdir/opt/jmeter/bin/jmeter"
}

# vim:set ts=2 sw=2 et:
