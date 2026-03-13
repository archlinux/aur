# Maintainer: labricecat <labricecat@duck.com>

pkgname='lrc-socat-git'
pkgver=r25.dc92563
pkgrel=1
pkgdesc="Rice Transfer Protocol"
arch=('x86_64')
url="https://codeberg.org/labricecat/socat"
license=('Apache-2.0')
depends=('glibc' 'libcrypto.so' 'libssl.so')
makedepends=('git')
provides=('lrc-socat')
conflicts=('lrc-socat')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "socat"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "socat"
	make
}

package() {
	cd "socat"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm755 build/libsocat.so "$pkgdir/usr/lib/libsocat.so"
	install -Dm755 build/libsocat.a "$pkgdir/usr/lib/libsocat.a"

	install -Dm644 src/*.h -t "$pkgdir/usr/include/socat"
}
