# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=pscircle
pkgver=1.3.0
pkgrel=1
pkgdesc="visualizes Linux processes in a form of radial tree"
arch=(x86_64)
url="https://gitlab.com/mildlyparallel/pscircle"
depends=('cairo')
makedepends=('meson')
license=('GPL2')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('960e85219f42b633a4e663d3910082a8a2c27e80e02c7a525665910b6b210a81')

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
