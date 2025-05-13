# Maintainer: Matthias Baur <aur@matthiasbaur.me>
pkgname=noson-app
pkgver=5.6.10
pkgrel=1
pkgdesc="The essential to control music from your SONOS devices on Linux platforms"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://janbar.github.io/noson-app"
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'libpulse' 'flac')
makedepends=('cmake' 'git')
source=("git+https://github.com/janbar/noson-app.git#tag=${pkgver}")

sha256sums=('c8f63c23bdb5560bc040ce8c0670346bc029568a349a4feab3d13e7cb005683a')

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/${pkgname%-git}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
