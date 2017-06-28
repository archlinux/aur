# Maintainer: Patrik Karlsson <pata.karlsson@gmail.com>

pkgname=mapollage
pkgver=1.0.9
pkgrel=1
pkgdesc="mapollage is a photo album generator for Google Earth, a photo kml maker"
arch=('any')
url="https://trixon.se/projects/mapollage/"
license=('Apache')
depends=('java-runtime=8')
makedepends=('desktop-file-utils')
source=(
	"https://trixon.se/files/$pkgname-$pkgver-bin.zip"
	'mapollage.sh'
	'mapollage.desktop'
)
sha256sums=(
	'ad781a5adbed8043ab2b00ec7be34be4b7925b88d6a2014daf6809f2176dd8d1'
	'9f7c96ef813c3cfda38abc83db1143abff6857b79cd75074abdce224a70d9ab4'
	'7f908c214693692d259108df6239b0ac86b5c8b56381f9cce13ef5d9f2e5f930'
)

package() {
	pushd "$srcdir/$pkgname-$pkgver"

	# jars
	install -d "$pkgdir/usr/share/java/mapollage"
	find -name '*.jar' -execdir install -m644 {} "$pkgdir/usr/share/java/mapollage" \;

	# icon
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	install -m644 mapollage.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/mapollage.png"

	popd

	# launchers
	install -Dm755 "$srcdir/mapollage.sh" "$pkgdir/usr/bin/mapollage"

	# .desktop
	desktop-file-install $pkgname.desktop --dir "$pkgdir/usr/share/applications/"

	# remove version from filename
	mv "$pkgdir/usr/share/java/mapollage/mapollage-${pkgver}.jar" "$pkgdir/usr/share/java/mapollage/mapollage.jar"
}

