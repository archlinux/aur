# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=('winkeyer-server')
_offname=winkeyer_server
_authorname=ok2cqr
pkgver=0.4.0
pkgrel=4
pkgdesc='Ham Radio - Winkey USB - UDP server'
arch=('i686' 'x86_64')
url='http://www.cqrlog.com/?q=node/149'
license=('GPL')
provides=('winkeydaemon')
depends=('gtk2')
optdepends=('hamradio-menus')
makedepends=('unzip' 'lazarus')
source=(https://github.com/${_authorname}/${_offname}/archive/master.zip
	$pkgname.desktop
	$pkgname.png)

prepare() {
	cd "$srcdir/${_offname}-master"
	sed -i 's/--ws=gtk2 src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 src/g' Makefile
}

build() {
	cd "$srcdir/${_offname}-master"
	make
}

package() {
	cd "$srcdir/${_offname}-master"
	make DESTDIR="$pkgdir/" install

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('e2a28fd46c5eccdc15c8aa3f9430daf2'
         '9c588aad780ee4fe5df8f1fe17a72678'
         '6f8961c3eb9c8eaa0ca85d1e214f5593')
sha256sums=('07f47684693b1b552b4694c5849fce8c3fd6a96ac0b76f2933b21c5925b1e2ba'
            'beb8b9e18d6009d08729f7c0ae4d5160de4862508a0d42c7bcd3edb8ba1f0359'
            'c0e07465744c11f519e2e14c54006871863b74d873b09db04e7fd4fa97d4071e')
