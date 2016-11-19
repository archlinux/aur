# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=exodus
pkgver=1.11.0
pkgrel=1
pkgdesc="All-in-one app to secure, manage and exchange blockchain assets"
arch=('x86_64' 'i686')
url="https://exodus.io"
license=('custom:"Copyright © 2016 Exodus"')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://exodusbin.azureedge.net/releases/exodus_linux_${pkgver}.zip"
				"${pkgname}.desktop")
sha256sums=('24b168d6d2f06d5da9ab09f41fa577d00d0ba591be4df79f8c5d37d3c5f10ef5'
            '04676d81272a35a91150a7eec4640e69ca50f2e479d29fad8be90160ee74122c')

package() {
	cd $srcdir/exodus_linux_${pkgver}/Exodus-linux-x64
	
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -a * $pkgdir/opt/$pkgname
	rm $pkgdir/opt/$pkgname/{LICENSE*,version}
	ln -s $pkgdir/opt/$pkgname/Exodus $pkgdir/usr/bin/$pkgname

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  chmod -R ugo+rX $pkgdir/opt
}
