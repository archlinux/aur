# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=marote
pkgver=3.1
pkgrel=3
pkgdesc="Rig conrol program for Elecraft K2 Transceiver"
arch=('i686' 'x86_64')
url="http://hamsoftware.org/old_index.html"
license=('GPL')
depends=('qt3' 'hamradio-menus')
optdepends=('xlog: logbook')
source=(http://www.hamsoftware.org/$pkgname-$pkgver.tgz
        $pkgname.desktop
        $pkgname.png)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	/usr/lib/qt3/bin/qmake marote.pro
	sed -i s:'\$(QTDIR)\/include':'\/usr\/include\/qt3': Makefile
}   
 
build() {
	cd $srcdir/$pkgname-$pkgver

	make MOC=/usr/lib/qt3/bin/moc UIC=/usr/lib/qt3/bin/uic || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"

	sed -i 's:\/local::g' Makefile
	make INSTALL_ROOT="$pkgdir/" install

	install -Dm644 README $pkgdir/usr/share/$pkgname/docs/README.txt
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('2848d998f971bc836463da231ff7759d'
         '18b8d7c22a960ca6c2cd1868140f8af5'
         'ba79c00f4e68bd67062c7616f9349620')
sha256sums=('2d9953828a888de3737c407b74d4bdfcf8dbf70b111acfce4db721ed1b608639'
            '935ab0354b34b58efc1cb4e71044b46f868975e719a20e4d556e9228240ca137'
            '48bbab2e8c3affd34ed22d97d8b24f49974aa3bacbdfabe91e3363e9d2bb8678')
