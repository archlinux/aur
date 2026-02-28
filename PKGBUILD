# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=advancescan
pkgname=$_pkgname-git
pkgver=1.18.r13.g013f703
pkgrel=1
pkgdesc="A command line rom manager for AdvanceMAME and AdvanceMESS"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.advancemame.it/scan-readme"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git' 'libgcc' 'libstdc++' 'zlib')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/amadvance/advancescan.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	autoreconf -fiv
}

build() {
	cd $_pkgname
	./configure --prefix=/usr
	make
}

check() {
	cd $_pkgname
	make check
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so' 'libz.so')

	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
