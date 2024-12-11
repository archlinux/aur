# Maintainer: Joshua Jensch <jenschjoshua at gmail dot com>

pkgname=pamix
pkgver=2.0
pkgrel=1
pkgdesc="ncurses pulseaudio mixer"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/patroclos/PAmix"
license=('MIT')
depends=('ncurses' 'libpulse')
makedepends=('cmake' 'make' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/patroclos/PAmix/archive/refs/tags/2.0.tar.gz")
md5sums=('37180db3dc9c1c9bdf070de8e9dfc6af')

build() {
	cmake -S "PAmix-${pkgver}/" -B build -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=release
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "PAmix-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
