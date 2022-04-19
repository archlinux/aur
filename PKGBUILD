# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-recursive
pkgver=1.1.0
pkgrel=1
pkgdesc="A recursive structural transfer module for Apertium"
arch=('i686' 'x86_64')
url="https://wiki.apertium.org/wiki/Apertium-recursive"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc' 'utf8cpp')
depends=('lttoolbox>=3.6.0' 'apertium>=3.8.0' 'libxml2>=2.6.17' 'pcre' 'icu')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a741bed2f6917a835927f7098f1df92f3d616f09d7674ffc03ca99db0e3f5c0e')

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
