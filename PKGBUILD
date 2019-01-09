# Maintainer: Jake <aur@ja-ke.tech>
pkgname=flatcam
_pkgname=FlatCAM
pkgver=8.5
pkgrel=1
pkgdesc="Generates CNC gcode from 2D PCB files (Gerber/Excellon/SVG)"
arch=('any')
url="http://flatcam.org"
license=('MIT')
depends=('tk' 'python2-simplejson' 'python2-pyqt4' 'python2-scipy' 'python2-matplotlib' 'python2-shapely' 'python2-rtree' 'python2-svg.path' 'python2-sip-pyqt4')

source=("https://bitbucket.org/jpcgt/$pkgname/downloads/$_pkgname-$pkgver.zip"
		"$pkgname"
		"$pkgname.desktop")
md5sums=('4a758880b5122ff146c22a7ad0fa563f'
         '80700f0bb07c959dc3019d9664472387'
         '3ceea80a75a2bcfecc348a7399731c7c')



build() {
	cd "$_pkgname-$pkgver"
	python2 -O -m py_compile *.py
}


package() {
	install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "$_pkgname-$pkgver"
	install -D -m644 "share/flatcam_icon256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	rm -r *.sh doc FlatCAM_GTK
	mkdir -p "${pkgdir}/opt/$pkgname"
	cp -r * "${pkgdir}/opt/$pkgname"
}
