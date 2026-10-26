# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-doctools
pkgver=6.31.0
pkgrel=1
pkgdesc='Documentation generation from docbook'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-doctools'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'docbook-xsl'
	'glibc'
	'libstdc++'
	'libxml2'
	'libxslt'
	'qt6-base'
	'sonic-frameworks-archive'
)
makedepends=(
	'doxygen'
	'perl-uri'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-internationalization'
)
provides=('kdoctools')
conflicts=('kdoctools')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5aa6352150a4ca25729512d4038df19b8dbd0de1c4b9d32d0efb5e678fcfcde8')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF \
		-DDocBookXSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-nons
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
