# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
# Contributor: Aryan Ghasemi <aryangh1379@gmail.com>
pkgname=supertux-advance
pkgver=0.2.0
pkgrel=4
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=(any)

url="https://github.com/KelvinShadewing/supertux-advance"
license=('AGPL-3.0-only')

depends=('brux-gdk')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-exec" "$pkgname.desktop")
sha256sums=('54ec98cfa37adc972e099cf7a143af84958e4b120a1d3173cc417094a4c430d0' 'SKIP' 'SKIP')

package() {
	# Executable and Desktop file
	install -Dm755 "$pkgname-exec" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$pkgname-$pkgver"

	# Copy folder structure with good permissions
	/usr/bin/find . \
	-type d \
	-exec \
	/usr/bin/install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;

	# Populate with game-data, except the Windows bits and the executable
	/usr/bin/find . \
	-type f \
	-exec \
	/usr/bin/install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;

	cd ..

	# Remove on next release
	rm -rf "${pkgdir}/opt/${pkgname}/contrib/azzy"

	install -Dm644 "$pkgname-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
}
