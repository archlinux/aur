# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>

pkgname=rw-git
pkgver=1.0.r0.g755e3df
pkgrel=1
pkgdesc="Blockwise input/output"
arch=('x86_64')
url="https://sortix.org/rw"
license=('custom:ISC')
depends=('glibc')
makedepends=('git')
provides=('rw')
conflicts=('rw')
source=('git+https://gitlab.com/sortix/rw-portable.git')
md5sums=('SKIP')

pkgver() {
	cd rw-portable
	git describe --long | sed 's/^rw-portable-//;s/-/.r/;s/-/./'
}

build() {
	cd rw-portable
	make
}

package() {
	cd rw-portable
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
