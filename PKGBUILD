# Maintainer: Andy Alt <arch_stanton5995@proton.me>
# Contributor: Kilian Köppchen <kiliankoeppchen at gmail dot com>

pkgname=fifechan
pkgver=0.1.5
pkgrel=2
pkgdesc="A C++ GUI library designed for games. It comes with a standard set of 'widgets'."
arch=('x86_64')
url="http://fifengine.github.io/fifechan/"
license=('LGPL-2.1-or-later')
depends=('sdl2_image')
makedepends=('cmake')
provides=('fifechan')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fifengine/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('713f46ac8310f333c599a17c53e83b43c1e71dc0a631596eae0089877409e48f87fa25ca067734817ca8ddc75ecd7b99ccda227fc29036676a87e441f8aa7d2d')
build() {
	local cmake_options=(
		-B build
		-S "${srcdir}/${pkgname}-${pkgver}"
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
		-DCMAKE_INSTALL_PREFIX=/usr
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
