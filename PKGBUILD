# Maintainer: Sir-Photch <sir-photch at posteo dot me>
# PKGBUILD adapted from: Hans Gaiser <hansg91@gmail.com>

pkgname=ids-peak-ueyetl
pkgdesc="IDS peak is a modern, free software development kit for all USB3 Vision and GigE Vision compliant industrial cameras from any manufacturer. (Version with uEye transport layer)"
pkgver=2.9.0
pkgrel=1
provides=(ids-peak)
conflicts=(ids-peak)
arch=(x86_64)
license=(custom)
url="https://en.ids-imaging.com/ids-peak.html"
depends=('libusb' 'qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
optdepends=('ueyed: IDS uEye camera deamon (USB and ethernet)')

_dir="ids-peak-with-ueyetl_$pkgver.0-48_amd64"
source=(
	"https://de.ids-imaging.com/files/downloads/ids-peak/software/linux-desktop/$_dir.tgz"
	"ids-peak.rules"
	"ids-peak-sysusers.conf"
)
sha512sums=('fd0ffc25699d4fe6baf672640057009a9151d6a65d9cc839f569768977dc83906598b08b9f6a75bc2ee657626f3435b20719621140bb45941e9f587a73567b0c'
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
}
