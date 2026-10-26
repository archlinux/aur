# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=sonic-frameworks-sso
pkgver=8.61.2.3
pkgrel=2
pkgdesc='A D-Bus service which performs user authentication on behalf of its clients'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-sso'
license=('LGPL')
depends=(
	'glibc'
	'libgcc'
	'qt6-base'
)
makedepends=(
	'cmake'
	'doxygen'
	'graphviz'
	'ttf-font'
)
provides=('signond')
conflicts=('signond')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('34ba02f2fbaf13c075777401a2606a99889ace52d39356b4f2e787fc2d57e1a6')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBEXECDIR=bin \
		-DCMAKE_INSTALL_SYSCONFDIR=/etc
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	# Do not ship docs
	rm -rf "$pkgdir"/usr/share/doc
}
