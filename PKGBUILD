
# Maintainer: Your Name <youremail@domain.com>
pkgname=ferret-sidejack
pkgver=3.0.1
pkgrel=1
pkgdesc="A cookies spoof tool"
arch=('x86_64' 'x64')
url="http://pkg.kali.org/pkg/ferret-sidejack"
license=('GPL')
source=('git://git.kali.org/packages/ferret-sidejack.git' 'pixie.patch')
md5sums=('SKIP' 'df9e9d84f3a5d0283725a9c94f5bf8c5')
makedepends=('git')
prepare() {
	cd "$srcdir/$pkgname"
	git reset --hard eba08a8863a0c1295921a043fdea422496805e47
	patch -p0 src/pixie.c < $srcdir/pixie.patch
	mkdir bin tmp
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	mkdir $pkgdir/usr $pkgdir/usr/bin
	install bin/ferret $pkgdir/usr/bin/$pkgname
}
