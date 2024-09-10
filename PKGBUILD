# Maintainer: Witko <kos.na.bordel@gmail.com>
# Contributor: Stick <stick@stma.is>
# Contributor: Ngo Huy <severus@theslinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=jmeter
pkgver=5.6.3
pkgrel=4
arch=('any')
pkgdesc="Java application designed to load test functional behavior and measure performance"
url="http://jmeter.apache.org/"
license=("apache")
depends=("java-environment>=8")
options=('!strip')
source=("http://archive.apache.org/dist/jmeter/binaries/apache-${pkgname}-${pkgver}.tgz"
  "${pkgname}.desktop")
sha256sums=('f68efc17fe060f698c48a6abe2599a933927486bda2924dbe14c74895318ddde'
  '5825c95e8aa3fd29bb0e67ae1f6f4640008f74bac756b62394c70b61a3f506ad')
validpgpkeys=('C4923F9ABFB2F1A06F08E88BAC214CAA0612B399')

package() {
  install -dm755 "$pkgdir/opt/jmeter" "$pkgdir/usr/bin" "${pkgdir}/usr/share/applications" "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -a "apache-$pkgname-$pkgver"/* "$pkgdir/opt/jmeter"
  ln -s /opt/jmeter/bin/jmeter "$pkgdir/usr/bin/jmeter"
  ln -s /opt/jmeter/docs/images/jmeter_square.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/jmeter.svg"
  sed -i '/^java/s|`dirname "$0"`|/opt/jmeter/bin|' "$pkgdir/opt/jmeter/bin/jmeter"
}

# vim:set ts=2 sw=2 et:
