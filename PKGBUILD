# Maintainer: Witko <kos.na.bordel@gmail.com>
# Contributor: Ngo Huy <severus@theslinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Nathaniel Stickney <nstickney@gmail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=jmeter
pkgver=3.3
pkgrel=2
arch=('any')
pkgdesc="Java application designed to load test functional behavior and measure performance"
url="http://jmeter.apache.org/"
license=("apache")
depends=("java-environment>=8")
options=('!strip')
source=("http://www.us.apache.org/dist/jmeter/binaries/apache-${pkgname}-${pkgver}.tgz" "${pkgname}.desktop")
sha256sums=('65ceb4ac492de563b8f62ed782b0709cb86dc9fd8aec096f535ab102b33713a4' '5daa950d86d9369fd16669ce42447854cddf50e6d9272758ba012650afe1931e')
validpgpkeys=('C4923F9ABFB2F1A06F08E88BAC214CAA0612B399')

package() {
  install -dm755 "$pkgdir/opt/jmeter" "$pkgdir/usr/bin" "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -a "apache-$pkgname-$pkgver"/* "$pkgdir/opt/jmeter"
  ln -s /opt/jmeter/bin/jmeter "$pkgdir/usr/bin/jmeter"
  sed -i '/^java/s|`dirname "$0"`|/opt/jmeter/bin|' "$pkgdir/opt/jmeter/bin/jmeter"
}

# vim:set ts=2 sw=2 et:
