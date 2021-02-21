pkgname=isabelle-tum
pkgver=2021
pkgrel=1
pkgdesc="A generic proof assistant. It allows mathematical formulas to be expressed in a formal language and provides tools for proving those formulas in a logical calculus. Release mirror: TUM."
arch=('i686' 'x86_64')
url="https://isabelle.in.tum.de/"
license=('custom:BSD')
groups=('science')
depends=('perl' 'perl-libwww')
conflicts=('isabelle')
if test "$CARCH" == x86_64; then
	optdepends+=('lib32-glibc: for improved performance of Poly/ML on x86_64 machines'
               'lib32-gcc-libs: for improved performance of Poly/ML on x86_64 machines')
fi
optdepends=('texlive-core: document preparation')
source=(https://isabelle.in.tum.de/dist/Isabelle${pkgver//_/-}_linux.tar.gz
         isabelle.desktop)
md5sums=('9b91f6f78a5d3ab701d07f15404746d2'
         '63add57fc05e5334ad1582d07a0c7146')
sha256sums=('5d7811a658c43448456de1cb61e3bc27b93ac3ef2f3dc51a1aa6244c78624fc7'
            'a619c0c48805f80862c4bb8f2448ce8f3d0bef7cebda7ef98a21bdd40a5652da')


# required Packages are automatically build on the first run
#         
# build() {
#	cd "$srcdir/Isabelle${pkgver//_/-}"
#	./bin/isabelle build Pure
#	./bin/isabelle build HOL
# }

package() {
  install -Dm644 "isabelle.desktop" "$pkgdir/usr/share/applications/isabelle.desktop"
  
	cd "$srcdir/Isabelle${pkgver//_/-}"
	mkdir -p $pkgdir/opt/isabelle
	cp -r * $pkgdir/opt/isabelle/
	$pkgdir/opt/isabelle/bin/isabelle install -d /opt/isabelle $pkgdir/usr/bin
}
