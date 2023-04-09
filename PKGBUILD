# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=pscircle
pkgver=1.4.0
pkgrel=1
pkgdesc="visualizes Linux processes in a form of radial tree"
arch=(x86_64)
url="https://gitlab.com/mildlyparallel/pscircle"
depends=('cairo')
makedepends=('meson')
license=('GPL2')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('99a4fa1d7e4ca28b067c5c2bb977352b4e6fcb9eb22349c9d33456971f282d7f')

build() {
	cd "$pkgname-v$pkgver"
	mkdir -p build
	cd build
	meson --prefix /usr ..
	ninja
}

package() {
	cd "$pkgname-v$pkgver/build"
	DESTDIR="$pkgdir" ninja install
	install -Dt "$pkgdir/usr/lib/systemd/user" -m644 ../examples/pscircle.service
	install -Dt "$pkgdir/usr/share/$pkgname/examples" -m755 ../examples/*.sh
}
