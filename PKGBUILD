# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey
pkgver=0.0.4
pkgrel=1
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64' 'aarch64')
url="https://github.com/7ka-Hiira/fcitx5-hazkey"
license=('MIT')
depends=('fcitx5>=5.0.4')
optdepends=('vulkan-driver: Zenzai neural conversion support')
makedepends=('cmake' 'swift-language' 'vulkan-headers')
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/archive/refs/tags/0.0.4.tar.gz")
sha256sums=('9f9b095f359d4b75886b1c884be91fcba5f1914c973cf8c79b2dd25ca3b54846')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build

	# First run fails for unknown reason, so run it twice
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr || true
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install

	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
