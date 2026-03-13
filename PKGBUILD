# Maintainer: labricecat <labricecat@duck.com>

pkgname='lrc-ricetp-git'
pkgver=r28.5f3a408
pkgrel=1
pkgdesc="Rice Transfer Protocol"
arch=('x86_64')
url="https://codeberg.org/labricecat/ricetp"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git')
provides=('lrc-ricetp')
conflicts=('lrc-ricetp')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "ricetp"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "ricetp"
	make
}

package() {
	cd "ricetp"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm755 build/libricetp.so "$pkgdir/usr/lib/libricetp.so"
	install -Dm755 build/libricetp.a "$pkgdir/usr/lib/libricetp.a"

	install -Dm644 src/*.h -t "$pkgdir/usr/include/ricetp"
	install -Dm644 src/v1/*.h -t "$pkgdir/usr/include/ricetp/v1"
}
