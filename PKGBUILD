# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=sonic-polkit
pkgver=0.201.2
pkgrel=1
pkgdesc='A library that allows developers to access PolicyKit API with a nice Qt-style API'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-polkit'
license=(
	'BSD-3-Clause'
	'GPL-2.0-or-later'
	'LGPL-2.0-or-later'
)
depends=(
	'glib2'
	'glibc'
	'libgcc'
	'libstdc++'
	'polkit'
	'qt6-base'
)
makedepends=('cmake')
provides=('polkit-qt6')
conflicts=('polkit-qt6')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('22757af51dc38179936f6e5807eefaa01ba4d123c82319b150d8095027ff543e')

build() {
	cmake -B build -S "$pkgbase-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_MAJOR_VERSION=6
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 $pkgbase-$pkgver/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
}
