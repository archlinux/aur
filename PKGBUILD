pkgname=xnedit
pkgver=1.6.3
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
	perl # pod2man
	pkg-config
)
source=(git+https://github.com/unixwork/xnedit#tag=v$pkgver)
sha256sums=('ae188af55ea747b3ffc9f7a0e2d69d805de7d4045598d062a9d567adff0c16c9')

prepare() {
	cd $pkgname
}

build() {
	cd $pkgname
	export PATH="$PATH:/usr/bin/core_perl"
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
