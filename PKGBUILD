# Maintainer: tblFlip <root@tblflip.de>

pkgname=liftoff-bin
pkgver=0.10.7
pkgrel=1
pkgdesc="A mobile and desktop lemmy client written in flutter"
_pkgname="${pkgname%-bin}"

arch=("x86_64")
url="https://github.com/liftoff-app/liftoff"
license=("GPL2")

source=(
	"$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-$arch-linux.tar.gz"
	"$pkgname-$pkgver.svg::$url/raw/v$pkgver/assets/app_icon.svg"
	"$_pkgname.desktop"
)

sha256sums=(
	"9bb91655905d84b9f01679a3ca3d50917b93c2084f0e827524427c02f1800c5c"
	"4295302ec05ff67bb0ed808c1d0b316402010218e064957d655a1274a83cf80c"
	"930a365a43afed19a6f212a0c036e580596ce072d8a56504d295503672cb4eb3"
)

provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
	install -Dm644 "$pkgname-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
	install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -d "$pkgdir/opt/$_pkgname"
	install -d "$pkgdir/usr/bin"

	cp -ar --no-preserve=ownership data "$pkgdir/opt/$_pkgname/data"
	cp -ar --no-preserve=ownership lib "$pkgdir/opt/$_pkgname/lib"
	cp -a --no-preserve=ownership Liftoff "$pkgdir/opt/$_pkgname/Liftoff"

	ln -s "/opt/$_pkgname/Liftoff" -t "$pkgdir/usr/bin"
	chown -R root:root "$pkgdir/"
}
