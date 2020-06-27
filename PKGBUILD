# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgver=21.0.11
pkgrel=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server/'
arch=('any')
license=('GPL3')

depends=('libadalang')
makedepends=('gcc-ada' 'gprbuild')

provides=('ada_language_server')
conflicts=('ada_language_server-git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/AdaCore/ada_language_server/archive/$pkgver.tar.gz" 'Makefile.patch')
sha1sums=('d1e29d21162d465b92c4dce33c3a8a0b787baeee' 'f8afe12dedcef533b6888aa227da2a5dbe199376')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=0 --input="${srcdir}/Makefile.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
	make LIBRARY_TYPE=relocatable BUILD_MODE=prod
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

	make LIBRARY_TYPE=relocatable BUILD_MODE=prod DESTDIR="$pkgdir/usr" install
}
