# Maintainer: Marc Riera <marcriera@softcatala.org>
# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.8.3
pkgrel=1
pkgdesc="Core tools (driver script, transfer, tagger, formatters) for the FOSS RBMT system Apertium"
url="https://www.apertium.org/"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'autogen' 'flex' 'autoconf' 'automake' 'libtool' 'zlib' 'utf8cpp')
depends=('lttoolbox>=3.7.1' 'expat' 'gawk' 'libxslt' 'pcre' 'gcc-libs' 'libxml2>=2.6.17' 'gettext' 'icu')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2a42e327cb6206254fc8242041398678ce0073dabf4c2de4c567c04e8336187')

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
