# Maintainer: Fabian Gundlach <archlinux at fabiangundlach dot org>

pkgname=sauklaue
pkgver=1.0.6
pkgrel=1
pkgdesc='Notetaking application for lecturing with an external graphics tablet'
url="https://github.com/fagu/$pkgname"
license=('MIT')
arch=('x86_64')
depends=('qt5-base' 'capnproto' 'cairomm' 'poppler-glib' 'hicolor-icon-theme' 'libx11' 'libxi' 'kconfig' 'kconfigwidgets' 'kguiaddons')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fagu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6733da836583defe25916d68837d0b97729a275147c9351097072d1ee6a9b0eb')

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
