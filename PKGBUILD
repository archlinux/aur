# Maintainer: ThePirate42 <aur@thepirate42.org>

pkgname=project-sushi
pkgver=a1.2.4
pkgrel=2
pkgdesc="A short but challenging 2D platformer game"
arch=('i686' 'x86_64')
url="https://www.patreon.com/posts/33983587"
license=('unknown')
depends=('wine' 'sh' 'hicolor-icon-theme')
makedepends=('icoutils')
options=('!strip')
source=("$pkgname-$pkgver.zip::https://www.patreon.com/file?h=33983587&i=5219261" "$pkgname.desktop" "$pkgname")
sha256sums=('25130969828988141c1da20dbe92322216c6c918c90a8105156592a435ddec8d'
            '24b3f56c0ec3205278f0d34250258aae4f9e9349a0105a8c20411efe397defe1'
            '78f7e9e4cb1e2358e058414baf06bf78a5027cbdd42b357dabc80d5a2c023090')

prepare() {

	wrestool -x --output="$srcdir"/$pkgname.ico -t14 "$srcdir"/ProjectSushi_$pkgver.exe
	icotool -x --output="$srcdir" "$srcdir"/$pkgname.ico

}

package() {

	install -d -m755 "$pkgdir/opt/$pkgname"
	install -m644 "$srcdir/"{data.win,options.ini} "$pkgdir/opt/$pkgname"
	install -m644 "$srcdir/ProjectSushi_$pkgver.exe" "$pkgdir/opt/$pkgname/$pkgname.exe"

	install -d -m755 "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications"

	install -d -m755 "$pkgdir/usr/share/icons/hicolor/"{16x16,24x24,32x32,48x48,128x128}"/apps"
	install -m644 "$srcdir/${pkgname}_1_16x16x32.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
	install -m644 "$srcdir/${pkgname}_2_24x24x32.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/$pkgname.png"
	install -m644 "$srcdir/${pkgname}_3_32x32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -m644 "$srcdir/${pkgname}_4_48x48x32.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
	install -m644 "$srcdir/${pkgname}_5_128x128x32.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

	install -d -m755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin"

}
