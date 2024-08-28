# Maintainer: Bombeuler <bombeuler@foxmail.com>
pkgname=writemonkey3
_pkgname=Writemonkey3
pkgver=3.3.0
_pkgver=3-3-0-jan2023
pkgrel=1
pkgdesc="Text Editor for Writers"
arch=('x86_64')
url="http://writemonkey.com/wm3/"
provides=("Writemonkey")
license=('proprietary')
source=(
	"$pkgname-$pkgver.zip::http://writemonkey.com/wm3/$_pkgname-linux-64bit-v$_pkgver.zip"
	"$pkgname.desktop"
)
noextract=("$pkgname-$pkgver.zip")
depends=(
	libnotify
	gtk2
	# gconf
	gcc
	electron25-bin
)
makedepends=(
	unzip
)
sha256sums=(
	"78cfe853aabbacba38538d2fd6637e0ae6d6465c52988795dae711c13cdb61d6"
    "cc60d97bb9dd206452fc19e64b835ad80370362c90247de6e987c43a5c60bf34"
)

prepare() {
	echo "  -> Extracting the $pkgname-$pkgver.zip"
	unzip "$pkgname-$pkgver.zip" -d "$srcdir"
}

package() {
	mkdir -p $pkgdir/opt/$pkgname
	mv  $srcdir/$pkgname/*  $pkgdir/opt/$pkgname/

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/nw $pkgdir/usr/bin/$pkgname

	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 $pkgdir/opt/$pkgname/wmFavicon.png $pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png
	install -Dm644 $pkgdir/opt/$pkgname/wm.ico $pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.ico
	install -Dm644 $pkgdir/opt/$pkgname/wm3icon.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png

}
