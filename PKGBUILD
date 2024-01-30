# Maintainer: Tai Lam <47955724+taivlam at users.noreply.github dot com>
pkgname=mouse-configurator
pkgver=1.0.0
pkgrel=1
pkgdesc="Configurator for HP 935 Creator Wireless Mouse from System76"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/mouse-configurator"
license=('MIT')
depends=('gtk3' 'hidapi' 'xz')
makedepends=('cargo' 'systemd')
source=("mouse-configurator-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('646f52902cba572b80e43959e036c88298ab86a1a67feb5e5416c0c427d70ab4')

prepare() {
	cd "mouse-configurator-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	make vendor
}

build() {
	cd "mouse-configurator-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	make VENDOR=1 prefix=/usr
}

package() {
	cd "mouse-configurator-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
