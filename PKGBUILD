# Maintainer: bitwave <aur [at] oomlu [dot] de>
# Contributor: Fabian Ruch <bafain [At] gmail [dOT] com>
pkgname=isabelle
pkgver=2015
pkgrel=2
pkgdesc="Isabelle is a generic proof assistant. It allows mathematical formulas to be expressed in a formal language and provides tools for proving those formulas in a logical calculus."
arch=('i686' 'x86_64')
url="http://www.cl.cam.ac.uk/research/hvg/Isabelle/"
license=('custom:BSD')
groups=('science')
depends=('perl' 'perl-libwww' 'python2')
if test "$CARCH" == x86_64; then
	optdepends+=('lib32-glibc: for improved performance of Poly/ML on x86_64 machines'
               'lib32-gcc-libs: for improved performance of Poly/ML on x86_64 machines')
fi
optdepends=('texlive-core: document preparation')
provides=(isabelle)
conflicts=(isabelle)
source=(http://www.cl.cam.ac.uk/research/hvg/Isabelle/dist/Isabelle${pkgver//_/-}_linux.tar.gz
        isabelle.desktop)
md5sums=('da5b4ca16cd0c83418514a5ea7ebec77'
         'bdbfb0a5309017a5bec4c5a89c3076d4')
sha256sums=('c2a0dee5eb698b4a7f2fa785316e32682d67c36aabbc1f683cbca2860aa9788e'
            '135a0fdd877d88ffe460914d582b5150d1cd7f3e764c696f14963df3333b5fcd')

build() {
	cd "$srcdir/Isabelle${pkgver//_/-}"
	./bin/isabelle build Pure
	./bin/isabelle build HOL
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
	cd "$srcdir/Isabelle${pkgver//_/-}"
	mkdir -p $pkgdir/opt/isabelle
	cp -r * $pkgdir/opt/isabelle/
	$pkgdir/opt/isabelle/bin/isabelle install -d /opt/isabelle $pkgdir/usr/bin
}
