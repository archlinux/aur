# Maintainer: shtrophic <aur at shtrophic dot net>
# Contributor: Hans Gaiser <hansg91@gmail.com>

pkgname=ids-peak-ueyetl
pkgdesc="IDS peak is a modern, free software development kit for all USB3 Vision and GigE Vision compliant industrial cameras from any manufacturer. (Version with uEye transport layer)"
pkgver=2.14.0
pkgrel=1
provides=(ids-peak)
conflicts=(ids-peak)
arch=(x86_64)
license=(custom)
url="https://en.ids-imaging.com/ids-peak.html"
depends=('libusb' 'qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
optdepends=('ueyed: IDS uEye camera deamon (USB and ethernet)')
install=$pkgname.install

_dir="ids-peak-with-ueyetl_$pkgver.0-265_amd64"
source=(
	"https://de.ids-imaging.com/files/downloads/ids-peak/software/linux-desktop/$_dir.tgz"
	"LICENSE.pdf::https://en.ids-imaging.com/files/downloads/licence/ids-license-terms-de-en.pdf"
	"ids-peak.rules"
	"ids-peak-sysusers.conf"
)
sha512sums=('7fbf43b92a5f1b3c14dea0acb7dd942257beb472f34644a64137b503ff62665845bca3a87087b01a95a8b1290ae3bde33793daad1976216b28c9b163b5e4ed95'
            '4ca85bb6f0b3a274d8df889957c0731441013af82c8690806773832ae595a9c50ce04ae9b86c84047eb180dc06d37607db6d68d2877cf3f110ae0f81d9af6956'
            'c92de0fa8f5c95ae95a715f70b6dfedb86a566eb80a9b090bb604785837e39ef40e3896d5e8f1f9271647958b87e4cef42dc0ed3a14cc4a1dd77c560d1ad5c4b'
            '05b961501a56b1827986aabc2a5ea8320b711fb0089615b212711814906c52af51205f04ffd9df436510362b185911797176bb6ed71bec4e35db8b1cd4d1f408')

package() {
	mkdir "$pkgdir/usr"
	cp -R "$srcdir/$_dir/bin"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/include" "$pkgdir/usr"
	cp -R "$srcdir/$_dir/lib"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/share"   "$pkgdir/usr"

	install -D -m 644 "$srcdir/ids-peak.rules" -t "$pkgdir/usr/lib/udev/rules.d"
	install -D -m 644 "$srcdir/ids-peak-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/ids-peak-sysusers.conf"
	install -D -m 644 "$srcdir/LICENSE.pdf" -t "$pkgdir/usr/share/licenses/$pkgname"
}
