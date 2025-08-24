# Maintainer: Matthias Baur <aur@matthiasbaur.me>
pkgname=noson-app
pkgver=5.6.13
pkgrel=1
pkgdesc="The essential to control music from your SONOS devices on Linux platforms"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://janbar.github.io/noson-app"
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'libpulse' 'flac')
makedepends=('cmake' 'git')
source=("git+https://github.com/janbar/noson-app.git#tag=${pkgver}")

sha256sums=('b799709f5c9cd7fb1a757f95241d48f85718adc90aeae79308a103d1c1482b64')

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/${pkgname%-git}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib
	cmake --build .
}

package() {
	cd "$srcdir/build"
	DESTDIR="$pkgdir/" cmake --install .
}
