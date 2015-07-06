# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=('winkeyer-server')
_offname=winkeyer_server
_authorname=ok2cqr
pkgver=0.4.0
pkgrel=2
pkgdesc='Ham Radio - Winkey USB - UDP server'
arch=('i686' 'x86_64')
url='http://www.cqrlog.com/?q=node/149'
license=('GPL')
provides=('winkeydaemon')
depends=('gtk2')
makedepends=('unzip' 'lazarus')
install=$pkgname.install
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
md5sums=('0dfda711dc2f02123a12c07df19c2942'
         '9c588aad780ee4fe5df8f1fe17a72678'
         '6f8961c3eb9c8eaa0ca85d1e214f5593')
sha256sums=('ef1d4777b5e9576028fd9bf4878d8c959a01a1beb579bc9cb7f994685345241a'
            'beb8b9e18d6009d08729f7c0ae4d5160de4862508a0d42c7bcd3edb8ba1f0359'
            'c0e07465744c11f519e2e14c54006871863b74d873b09db04e7fd4fa97d4071e')
