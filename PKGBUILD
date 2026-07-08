# Maintainer: Cynthia Rey <cynthia@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=vmaware
_pkgname=VMAware
pkgver=2.8.0
pkgrel=1
pkgdesc='Advanced VM detection library and tool'
url='https://github.com/NotRequiem/VMAware'
arch=('x86_64')  # Upstream's supposedly compatible with other architectures but this is untested so for now it's x86_64 only
depends=(
	glibc
	libgcc
	libstdc++
)
makedepends=('cmake')
license=('MIT')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NotRequiem/VMAware/archive/refs/tags/v$pkgver.tar.gz")

b2sums=('649bf224f6c5cf7d8017dcdf5cf62cc7e510cb26407debc1f5e62bbd607899e5cd1765a22a297b938aa3dbbd78aba72895fcb4d2723d4b7814eb6ffa06605aa7')

build() {
	local cmake_options=(
		-B build
		-S $_pkgname-$pkgver
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)

	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir/" cmake --install build

	install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
