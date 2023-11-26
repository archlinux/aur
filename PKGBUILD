# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=simpleini
pkgname=$_pkgname-git
pkgver=4.20.r1.gafb295b
pkgrel=1
pkgdesc="Cross-platform C++ library providing a simple API to read and write INI-style configuration files"
arch=('any')
url="https://github.com/brofield/simpleini"
license=('MIT')
makedepends=('git')
checkdepends=('gtest')
optdepends=('icu: for ICU conversion')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	if ((CHECKFUNC)); then
		make -C $_pkgname
	fi
}

check() {
	make -C $_pkgname test
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENCE.txt
}
