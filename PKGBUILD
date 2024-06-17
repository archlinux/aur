# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey
pkgver=0.0.2
pkgrel=1
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64' 'aarch64')
url="https://github.com/7ka-Hiira/fcitx5-hazkey"
license=('MIT')
depends=('fcitx5' 'swift-language')
makedepends=('cmake' 'swift-language')
conflicts=("fcitx5-hazkey" "fcitx5-hazkey-git")
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/archive/refs/tags/0.0.2.tar.gz")
sha256sums=('e1c47548f99fce3f9a7294f5735b369bcd279b7c19e9119bcead0b940aed500d')

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