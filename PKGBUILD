# Maintainer: Callan Barrett <callan@zoocar.org>
pkgname=amd-disable-c6
pkgver=1.0
pkgrel=1
pkgdesc="Disable AMD C6 state on boot to prevent Ryzen freezes"
arch=('any')
url="https://github.com/joakimkistowski/amd-disable-c6.git"
license=('MIT')
depends=()
makedepends=()
source=('git+https://github.com/joakimkistowski/amd-disable-c6.git'
	'amd-disable-c6.patch')
md5sums=('SKIP'
         '43e8b85a0c58e85e36d752211e73055f')

prepare() {
	cd "$srcdir/$pkgname"
	patch --input="${srcdir}/amd-disable-c6.patch"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -m 540 $pkgname "$pkgdir/usr/bin"
	install -m 644 "${pkgname}.service" "$pkgdir/usr/lib/systemd/system"
}
