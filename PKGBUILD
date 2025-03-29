pkgname=xnedit
pkgver=1.6.2
pkgrel=1
pkgdesc="XNEdit text editor (a fork of the classic NEdit)"
url=https://github.com/unixwork/xnedit
license=(GPL2)
arch=(x86_64)
depends=(
	fontconfig
	libxft
	libxrender
	libxt
	openmotif
)
makedepends=(
	bison
	gcc
	git
	make
	pod2man
	pkg-config
)
source=(git+https://github.com/unixwork/xnedit#tag=v$pkgver)
sha256sums=('2ffbab8daf4f776e5d6ad8d2799656e42dab8f1b2e580a3f6662904c9ec8a306')

prepare() {
	cd $pkgname
}

build() {
	cd $pkgname
	make linux
	make -j1 docs
}

package() {
	cd $pkgname
	DESTDIR="$pkgdir" make install
	install -Dm0644 doc/xnc.man "$pkgdir/usr/share/man/man1/xnc.1"
	install -Dm0644 doc/xnedit.man "$pkgdir/usr/share/man/man1/xnedit.1"
	install -Dm0644 doc/xnedit.html "$pkgdir/usr/share/doc/$pkgname/xnedit.html"
	install -Dm0644 doc/xnedit.txt "$pkgdir/usr/share/doc/$pkgname/xnedit.txt"
}
