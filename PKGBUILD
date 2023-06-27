# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=coolterm-bin
binname=coolterm
pkgver=2.0.1
pkgrel=1
pkgdesc='simple GUI serial port terminal application (no terminal emulation)'
arch=(i686 x86_64)
url="http://freeware.the-meiers.org/"
license=(custom)
makedepends=('gendesk')
depends=('gtk3')
source=('coolterm.sh'
        'LICENSE')
source_i686=(${binname}-${pkgver}_32.zip::http://freeware.the-meiers.org/CoolTermLinux32Bit.zip)
source_x86_64=(${binname}-${pkgver}_64.zip::http://freeware.the-meiers.org/CoolTermLinux64Bit.zip)
sha256sums=('c9f4eb8afba21a3076b233bc2b27c6a5d8b1f5a0966ee1dfdefd258895afe79a'
            '3309abddebf57f96282762a63fe7937852fbad4e79e119fbe4c6aa227b197e94')
sha256sums_i686=('fb4072c5a37744bd685e19d1fd63f649ac9824512cb1e860f24128dfc2172ab4')
sha256sums_x86_64=('5b5c2d620d20e19f8e9aeef463ee2dcc23f7c843b6da2e36da05f045d6d668ce')

prepare() {
	gendesk -f --pkgname="$binname" --pkgdesc="$pkgdesc" --categories=Utility PKGBUILD
}

package() {
	install -d "$pkgdir"/opt/"$binname"
	cd CoolTermLinux*
	cp -R * "$pkgdir/opt/$binname"
	cd ..

	install -Dm755 "$srcdir"/coolterm.sh "$pkgdir"/usr/bin/$binname

	install -Dm644 "$srcdir"/$binname.desktop -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir"/LICENSE -t "$pkgdir"/usr/share/licenses/$binname
	install -d "$pkgdir"/usr/share/pixmaps
	ln -s ../../../opt/$binname/appicon_128.png "$pkgdir"/usr/share/pixmaps/$binname.png
}
