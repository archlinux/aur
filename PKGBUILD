# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=trickle-pipe
pkgver=1.0
pkgrel=1
pkgdesc='600 baud pipe and terminal'
arch=(x86_64)
url=https://github.com/sjmulder/trickle
license=(BSD)
depends=(glibc)
conflicts=(trickle)
source=(trickle-$pkgver.tar.gz::https://github.com/sjmulder/trickle/archive/$pkgver.tar.gz)
sha256sums=(b1029f75e43136cb0651ab61b23ec46e215cd4effd8294424961f7d70686ee59)

build() {
	cd trickle-$pkgver
	make
}

check() {
	cd trickle-$pkgver
	echo a | ./trickle >/dev/null
	./tritty -- echo -n
}

package() {
	cd trickle-$pkgver
	make install PREFIX="$pkgdir/usr"
	rm -r "$pkgdir/usr/share/doc"
	install -d "$pkgdir/usr/share/licenses/trickle"
	install LICENSE.md "$pkgdir/usr/share/licenses/trickle/"
}
