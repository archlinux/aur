# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christopher Loen <christopherloen at gmail dot com>

pkgname=aesfix
pkgver=1.0.1
pkgrel=3
pkgdesc='Error-correction for AES key schedules'
arch=('x86_64')
url='https://citp.princeton.edu/research/memory/'
license=('BSD')
depends=('gcc-libs')
source=("https://citpsite.s3.amazonaws.com/memory-content/src/aesfix-${pkgver}.tar.gz"
        "https://citpsite.s3.amazonaws.com/memory-content/src/aesfix-${pkgver}.tar.gz.asc")
sha256sums=('7b177e876caee6aae48f0123102f11df6594a738483f9a47f2c76fe81cc045d4'
            'SKIP')
validpgpkeys=('12E404FFD3C931F934052D06B8841A919D0FACE4')

prepare() {
	cd "$pkgname"
	sed -i '/CXXFLAGS/s/=/?=/;/(CXX)/s/$/ \$(LDFLAGS)/' Makefile
	cat Makefile
}

build() {
	cd "$pkgname"
	CXXFLAGS="$CXXFLAGS -funroll-loops" make
}

package() {
	cd "$pkgname"
	install -Dm 755 aesfix -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	find samples -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}
