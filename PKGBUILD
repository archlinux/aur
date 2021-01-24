# Maintainer: Fabian Gundlach <archlinux at fabiangundlach dot org>

pkgname=sauklaue
pkgver=1.0.2
pkgrel=1
pkgdesc='Notetaking application for lecturing with an external graphics tablet'
url="https://github.com/fagu/$pkgname"
license=('MIT')
arch=('x86_64')
depends=('qt5-base' 'capnproto' 'cairomm' 'poppler-glib' 'hicolor-icon-theme' 'libx11' 'libxi' 'kconfig' 'kconfigwidgets' 'kguiaddons')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fagu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('97d1ec2343507be3835134a5b12991ced76bba57b28f36bb8acbdbe75c5aeb2b')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd build
	make DESTDIR="${pkgdir}" install
}
