# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=pscircle
pkgver=1.3.1
pkgrel=1
pkgdesc="visualizes Linux processes in a form of radial tree"
arch=(x86_64)
url="https://gitlab.com/mildlyparallel/pscircle"
depends=('cairo')
makedepends=('meson')
license=('GPL2')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('29e278e34816be06b3355394b15a8db6b5818ddb305181be7dd408f4cdc43f43')

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
