# Maintainer: Marc Riera <marcriera@softcatala.org>
# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.8.1
pkgrel=1
pkgdesc="Core tools (driver script, transfer, tagger, formatters) for the FOSS RBMT system Apertium"
url="https://www.apertium.org/"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'autogen' 'flex' 'autoconf' 'automake' 'libtool' 'zlib' 'utf8cpp')
depends=('lttoolbox>=3.6.0' 'expat' 'gawk' 'libxslt' 'pcre' 'gcc-libs' 'libxml2>=2.6.17' 'gettext' 'icu')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b628975861e27be9577b485acb6e215fe258bacaf3569225aa546cd845a83dae')

build() {
	export CXXFLAGS="$CXXFLAGS -I/usr/include/utf8cpp"
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
