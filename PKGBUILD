# Maintainer: bitwave <aur [at] oomlu [dot] de>
# Contributor: Fabian Ruch <bafain [At] gmail [dOT] com>
pkgname=isabelle
pkgver=2015
pkgrel=1
pkgdesc="Isabelle is a generic proof assistant. It allows mathematical formulas to be expressed in a formal language and provides tools for proving those formulas in a logical calculus."
arch=('i686' 'x86_64')
url="http://www.cl.cam.ac.uk/research/hvg/Isabelle/"
license=('custom:BSD')
groups=('science')
depends=('perl' 'perl-libwww' 'python2')
if test "$CARCH" == x86_64; then
	depends+=('lib32-glibc' 'lib32-gcc-libs')
fi
optdepends=('texlive-core: document preparation')
provides=(isabelle)
conflicts=(isabelle)
source=(http://www.cl.cam.ac.uk/research/hvg/Isabelle/dist/Isabelle${pkgver//_/-}_linux.tar.gz)
md5sums=('da5b4ca16cd0c83418514a5ea7ebec77')
sha256sums=('c2a0dee5eb698b4a7f2fa785316e32682d67c36aabbc1f683cbca2860aa9788e')

build() {
	cd "$srcdir/Isabelle${pkgver//_/-}"
	./bin/isabelle build Pure
	./bin/isabelle build HOL
}

package() {
	cd "$srcdir/Isabelle${pkgver//_/-}"
	mkdir -p $pkgdir/opt/isabelle
	cp -r * $pkgdir/opt/isabelle/
	$pkgdir/opt/isabelle/bin/isabelle install -d /opt/isabelle $pkgdir/usr/bin
}
