# Maintainer: Fabian Gundlach <archlinux at fabiangundlach dot org>

pkgname=sauklaue
pkgver=1.0.4
pkgrel=1
pkgdesc='Notetaking application for lecturing with an external graphics tablet'
url="https://github.com/fagu/$pkgname"
license=('MIT')
arch=('x86_64')
depends=('qt5-base' 'capnproto' 'cairomm' 'poppler-glib' 'hicolor-icon-theme' 'libx11' 'libxi' 'kconfig' 'kconfigwidgets' 'kguiaddons')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fagu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('922ef578304bd9fccc1988bbb1f4159c80b031564ccb495e48c0033564b5fb5e')

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
