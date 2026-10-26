# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-spell-check
pkgver=6.31.0
pkgrel=1
pkgdesc='Spelling framework for Qt'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-spell-check'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
)
makedepends=(
	'aspell'
	'doxygen'
	'hspell'
	'hunspell'
	'libvoikko'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=(
	'aspell: spell checking via aspell'
	'hspell: spell checking for Hebrew'
	'hunspell: spell checking via hunspell'
	'libvoikko: Finnish support via Voikko'
	'qt6-declarative: QML bindings'
)
provides=('sonnet')
conflicts=('sonnet')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('147b9384d7d381741b7323d40233d8341c34aa91c52f5f5d0c92abf45fca8f1a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
