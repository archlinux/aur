# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-recursive
pkgver=1.1.2
pkgrel=1
pkgdesc="A recursive structural transfer module for Apertium"
arch=('any')
url="https://wiki.apertium.org/wiki/Apertium-recursive"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc' 'utf8cpp')
depends=('lttoolbox>=3.7.1' 'apertium>=3.8.3' 'libxml2>=2.6.17' 'pcre' 'icu')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed32fd1978825a2a455e358d6807c825f84c50c3860617d8f7fce76a676b5a21')

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
