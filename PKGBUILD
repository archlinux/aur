# Upstream Project Author: Roger Meier <roger.meier@pobox.com>
# PKGBUILD Maintainer: Bumsik Kim <k.bumsik@gmail.com>

pkgname=coolterm-bin
binname=coolterm
pkgver=1.6.0
pkgrel=2
pkgdesc='A simple GUI serial port terminal application (no terminal emulation)'
arch=('any')
url="http://freeware.the-meiers.org/"
license=(custom)
makedepends=('unzip' 'gendesk')
depends=('gtk3')
optdepends=('')

source=('src.zip::http://freeware.the-meiers.org/CoolTermLinux.zip'
        'coolterm.sh'
        'LICENSE')
sha256sums=('e7ed1424c1bd8e1fec77a7f864867fd74f9f00cc85cad1684623233c3f268622'
            'c9f4eb8afba21a3076b233bc2b27c6a5d8b1f5a0966ee1dfdefd258895afe79a'
            '3309abddebf57f96282762a63fe7937852fbad4e79e119fbe4c6aa227b197e94')

prepare() {
	gendesk -f --pkgname="$binname" --pkgdesc="$pkgdesc" --categories=Utility PKGBUILD
}

package() {
	install -d "$pkgdir"/opt/"$binname"
	cd CoolTermLinux
	cp -R * "$pkgdir/opt/$binname"
	cd ..

	install -Dm755 "$srcdir"/coolterm.sh "$pkgdir"/usr/bin/$binname

	install -Dm644 "$srcdir"/$binname.desktop -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir"/LICENSE -t "$pkgdir"/usr/share/licenses/$binname
	install -d "$pkgdir"/usr/share/pixmaps
	ln -s ../../../opt/$binname/appicon_128.png "$pkgdir"/usr/share/pixmaps/$binname.png
}
