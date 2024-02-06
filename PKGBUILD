# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=('winkeyer-server')
_offname=winkeyer_server
_authorname=ok2cqr
pkgver=0.4.0
pkgrel=5
pkgdesc='Ham Radio - Winkey USB - UDP server'
arch=('i686' 'x86_64')
url='http://www.cqrlog.com/?q=node/149'
license=('GPL')
provides=('winkeydaemon')
depends=('gtk2')
optdepends=('hamradio-menus')
makedepends=('unzip' 'lazarus')
source=(https://github.com/${_authorname}/${_offname}/archive/refs/heads/master.zip
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
md5sums=('24dfdffe03edf7c98648a20222c6779d'
         '9c588aad780ee4fe5df8f1fe17a72678'
         '6f8961c3eb9c8eaa0ca85d1e214f5593')
sha256sums=('a72f2d7ee76a880958cd6af8d609bbb0efc5cb761c26e7b62c7cda8544197ea6'
            'beb8b9e18d6009d08729f7c0ae4d5160de4862508a0d42c7bcd3edb8ba1f0359'
            'c0e07465744c11f519e2e14c54006871863b74d873b09db04e7fd4fa97d4071e')
