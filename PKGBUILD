pkgname=sheerdns-ng
pkgver=r20.1248e47
pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=2
pkgdesc="DNS server"
arch=(x86_64)
url="https://github.com/taraszka/sheerdns-ng"
license=('GPL')
depends=()
makedepends=('git')
source=("git+https://github.com/p5n/sheerdns-ng.git")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
