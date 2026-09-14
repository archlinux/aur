# Maintainer: Cynthia Rey <cynthia@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=vmaware
_pkgname=VMAware
pkgver=2.8.2
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

b2sums=('2a9ecdda10496252d35d4d0cb2cc7378b85f776fc9c42371cb60c520e0a2097e8dbdd3e452ef2ac82c4d6e621e61303440d173be35c45ca0a54869e1bfc5503f')

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
