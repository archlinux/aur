# Maintainer: Kyra Sierra <circleousdev@gmail.com>
pkgname=toilet-git
_pkgname=toilet
pkgver=r155.3eb9d58
pkgrel=1
pkgdesc="free replacement for the FIGlet utility."
arch=('x86_64' 'i686')
url="https://github.com/cacalabs/toilet"
license=('WTFPL')
depends=('libcaca')
makedepends=('git')
provides=('toilet')
conflicts=('toilet')
options=()
source=(git+https://github.com/cacalabs/toilet)
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir"/"$_pkgname"
	./bootstrap
	./configure --prefix="/usr"
	make
}

package() {
	cd "$srcdir"/"$_pkgname"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir"/usr/{bin,share,}
	mkdir -p "$pkgdir"/usr/share/man/man1
	install -Dm755 src/"$_pkgname" "$pkgdir"/usr/bin
	install -Dm644 doc/"$_pkgname".1 "$pkgdir"/usr/share/man/man1
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$_pkgname"/COPYING
}
