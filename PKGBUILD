# Maintainer: Cynthia Rey <cynthia@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=vmaware
_pkgname=VMAware
pkgver=2.8.1
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

b2sums=('9b4e9d078ce9b1698d820a64b6cae352556053e159ccfe3aa7bf09b4bec3f25a80939dd3f522b5364adc78354e41f0140493bdd91858b69c6efe9c31c56e10fe')

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
