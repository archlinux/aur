# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=advancescan
pkgname=$_pkgname-git
pkgver=1.18.r11.gc15ea1d
pkgrel=2
pkgdesc="A command line rom manager for AdvanceMAME and AdvanceMESS"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.advancemame.it/scan-readme"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/amadvance/advancescan.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	autoreconf -fiv $_pkgname
}

build() {
	cd $_pkgname
	./configure --prefix=/usr
	make
}

check() {
	make -C $_pkgname check
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
