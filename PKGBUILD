# Maintainer: SelfRef <arch@selfref.dev>

_appname=86BoxManager
pkgname=86box-manager-bin
pkgver=1.7.6.0e
pkgrel=3
pkgdesc="A (cross-platform) configuration manager for the 86Box emulator"
arch=('x86_64')
url="https://github.com/RetBox/86BoxManagerX"
license=('MIT')
depends=('dotnet-runtime-6.0' 'libice' 'libsm')
optdepends=('86box>=3.0: emulator')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("opt/$_appname/86Box.json" "opt/$_appname/86BoxVMs.json")
source=(
	"https://github.com/RetBox/86BoxManagerX/releases/download/v$pkgver/${_appname}_linux.tar.gz"
	"$_appname"
	"$_appname.desktop"
	"86Box.json"
	"86BoxVMs.json"
)
md5sums=('c1d70898edaa20188ec77e602f5d568c'
         '10d648510f7337be51436f6191e45bdb'
         'a0078cf9c88267a2fff82abe55d988f8'
         'fcc4426670c3fbe036bc29ab45ba3620'
         '057671d91413133a13a89fd6525c9bc3')

package() {
	install -Dm755 -d "$pkgdir/opt/$_appname"
	cp -r "$srcdir/dist/lin/." "$pkgdir/opt/$_appname"

	install -Dm644 "$srcdir/dist/lin/Resources/86Box-gray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appname.svg"
	install -Dm755 "$srcdir/$_appname" "$pkgdir/usr/bin/$_appname"
	install -Dm755 "$srcdir/$_appname.desktop" "$pkgdir/usr/share/applications/$_appname.desktop"

	# Currently application config can be stored only in the same directory as the executable
	install -Dm666 "$srcdir/86Box.json" "$srcdir/86BoxVMs.json" "$pkgdir/opt/$_appname/"
}
