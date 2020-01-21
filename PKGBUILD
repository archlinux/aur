# Maintainer: PyroPeter <pyropeter+aur@pyropeter.eu>
pkgname=yarrp-git
pkgver=r45.91bcd88
pkgrel=1
pkgdesc="High-speed Internet Topology Prober"
arch=(x86_64)
url="https://www.cmand.org/yarrp/"
license=(BSD)
depends=(zlib)
makedepends=(git)
provides=(yarrp)
conflicts=(yarrp)
source=('git+https://github.com/cmand/yarrp.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/yarrp"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/yarrp"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/yarrp"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
