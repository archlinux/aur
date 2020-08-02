# Maintainer: robertfoster

pkgname=zerynth-studio
_archivename=${pkgname%%-studio}.tar.xz
pkgver=2.6.0
pkgrel=1
pkgdesc="A powerful IDE for embedded programming in Python that enables the IoT"
arch=('x86_64')
url="https://www.zerynth.com/zerynth-studio/"
license=('COMMERCIAL')
depends=('gconf' 'libxss')
options=(!strip)
source=("https://downloads.zerynth.com/${_archivename}"
	"$pkgname.sh"
"$pkgname.desktop")
noextract=("${_archivename}")

package() {
	cd "$srcdir"
	msg2 "Extracting..."
	install -d "$pkgdir/opt/$pkgname"
	install -d $pkgdir/usr/share/pixmaps
	tar xvf ${_archivename} --overwrite -C "$pkgdir/opt/$pkgname"
	msg2 "Desktop stuff..."
	install -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	mv "$pkgdir/opt/$pkgname/img/android-icon-192x192.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	chmod +x "$pkgdir/opt/$pkgname/zerynth"
	chmod +44 -R "$pkgdir/opt/$pkgname/"

	msg2 "Cleaning..."
	find "$pkgdir" -type d -name "*.exe" -prune -exec rm -r '{}' \;
	find "$pkgdir" -type d -name "*.dll" -prune -exec rm -r '{}' \;
	find "$pkgdir" -type d -name "windows64" -prune -exec rm -r '{}' \;
	find "$pkgdir" -type d -name "mac" -prune -exec rm -r '{}' \;
	chmod +x "$pkgdir/opt/$pkgname/zerynth"
	chmod +44 -R "$pkgdir/opt/$pkgname/"
}

md5sums=('cad56e5e0a1b04b1220004470c7e08b1'
         '566bd15aa6acedd409673ab634ab1148'
         '6cc82b387ddbee922b8e246efa5a6b97')
