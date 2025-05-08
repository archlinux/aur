# Maintainer: Marc Riera <marcriera@softcatala.org>
# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.8.0
pkgrel=2
pkgdesc="Finite state compiler, processor and helper tools used by apertium"
url="https://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'cmake' 'utf8cpp' 'python')
depends=('libxml2>=2.6.17' 'gcc-libs' 'icu')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/lttoolbox/archive/refs/tags/v${pkgver}.tar.gz"
        "libxml2.patch")
sha256sums=('e18f8e3ab5b57491665f89ed77561579bc6ee80eb8c9c80b2bce490766444ee8'
            '785c6b339f9ac4c99713705c0d99761a9dd3e1d04bc9d2640c44785331a1eb4b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch lttoolbox/lt_comp.cc "$srcdir/libxml2.patch"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
