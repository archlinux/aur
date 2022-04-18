# Maintainer: Marc Riera <marcriera@softcatala.org>
# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.6.1
pkgrel=1
pkgdesc="Finite state compiler, processor and helper tools used by apertium"
url="https://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'utf8cpp')
depends=('libxml2>=2.6.17' 'gcc-libs' 'icu')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/lttoolbox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae45b16591ef160fd111eed6def2fad650e7af35d0c3a924eea7cdc60a44bf1b')

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
