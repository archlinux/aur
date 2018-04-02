# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>

pkgname=rw-git
pkgver=r2422.6d15ed57
pkgrel=1
pkgdesc="Blockwise input/output"
arch=('x86_64')
url="https://sortix.org/rw"
license=('custom:ISC')
depends=('glibc')
makedepends=('git')
source=('git+https://gitlab.com/sortix/sortix.git')
md5sums=('SKIP')

pkgver() {
	cd sortix
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd sortix/rw
	make
}

package() {
	cd sortix/rw
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
