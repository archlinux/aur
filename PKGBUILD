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
source=("https://dlcdn.apache.org//jmeter/binaries/apache-${pkgname}-${pkgver}.tgz"
  "${pkgname}.desktop")
sha512sums=('5978a1a35edb5a7d428e270564ff49d2b1b257a65e17a759d259a9283fc17093e522fe46f474a043864aea6910683486340706d745fcdf3db1505fd71e689083'
  '47efb9cc96e567e23cefec4a65dd72475b97fef2f9512e6f79db48c6fdef6f94b5224622ebc4c11101f47777c940befe6326082781d98ba745d3fcd8912bc7f9')
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
