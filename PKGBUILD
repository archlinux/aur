# Maintainer: Pooyan Khanjankhani <pooyankhan@gmail.com>
# SPDX-FileCopyrightText: 2025 Pooyan Khanjankhani <pooyankhan@gmail.com>
#
# SPDX-License-Identifier: 0BSD

pkgname=ella
pkgver='0.0.9'
pkgrel=2
pkgdesc='A process manager for running and managing services'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'armv6l' 'riscv64')
url='https://github.com/thekhanj/ella'
conflicts=('ella-bin')
license=('MIT')
makedepends=('go>=1.24.5')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a43d9c1f65048d1c3bffefa0ca7e7a32d6f73500ba5c369f315eba01f0cf185846dc1d53fbdd84c79794f119f2c3eff4ec4ad5c66bbedd8c7b0ff31940818b3d')

_go_cleanup() {
	chmod 700 "${srcdir}/gopath" -R
	rm -r "${srcdir}/gopath"
}

build() {
	export GOPATH="${srcdir}/gopath"
	cd "${srcdir}/ella-${pkgver}"
	PATH="$GOPATH/bin:$PATH" make
}

package() {
	cd "${srcdir}/ella-${pkgver}"
	./install "${pkgdir}"
}
