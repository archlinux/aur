# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-separable
pkgver=0.6.1
pkgrel=1
pkgdesc="Module for reordering separable/discontiguous multiwords."
url="https://wiki.apertium.org/wiki/Apertium_separable"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc' 'utf8cpp')
depends=('lttoolbox>=3.7.0' 'zlib')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-separable/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a288f3aaf9f8a621e28423ee8bc81619305f24570279aa1cfdc75cfb2a40df7')

build() {
    export CXXFLAGS="$CXXFLAGS -I/usr/include/utf8cpp"
    cd "$srcdir/${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
