# Maintainer: Kyra Sierra <circleousdev@gmail.com>
pkgname=toilet-git
_pkgname=toilet
pkgver=20161027
pkgrel=1
pkgdesc="free replacement for the FIGlet utility."
arch=('x86_64' 'i686')
url="https://github.com/cacalabs/toilet"
license=('WTFPL')
depends=('libcaca')
makedepends=('git')
provides=('toilet')
conflicts=('')
options=()
source=(git+https://github.com/cacalabs/toilet)
md5sums=('SKIP')
build() {
	cd "$srcdir"/"$_pkgname"
	./bootstrap
	./configure
	make
	cd doc
	gzip "$_pkgname".1
}
package() {
	cd "$srcdir"/"$_pkgname"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir"/usr/{bin,share,}
	mkdir -p "$pkgdir"/usr/share/man/man1
	install -Dm755 src/"$_pkgname" "$pkgdir"/usr/bin
	install -Dm644 doc/"$_pkgname".1.gz "$pkgdir"/usr/share/man/man1
}
