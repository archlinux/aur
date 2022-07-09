# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=paml
pkgver=4.10.5
pkgrel=1
pkgdesc="Phylogenetic analysis by maximum likelihood. https://doi.org/10.1093/molbev/msm088"
arch=('x86_64')
url="http://abacus.gene.ucl.ac.uk/software/"
license=('GPL3')
depends=('glibc')
makedepends=('make')
provides=('paml')
source=("https://github.com/abacus-gene/paml/archive/refs/tags/v${pkgver}.zip")
sha256sums=('ba4a1c7a485f3a7f730a0e19a829c8f27784a250788d8e8c5be1419eb9851c29')
prepare(){
	cd "$pkgname-$pkgver"/
	mkdir bin
}
build() {
	cd "$pkgname-$pkgver"/src
#	gcc -O3 -o baseml baseml.c tools.c
#	gcc -O3 -o basemlg basemlg.c tools.c
#	gcc -O3 -o codeml codeml.c tools.c
#	gcc -O3 -o pamp pamp.c tools.c
#	gcc -O3 -o mcmctree mcmctree.c tools.c
#	gcc -O3 -o evolver evolver.c tools.c
#	gcc -O3 -o yn00 yn00.c tools.c 
#	gcc -O3 -o chi2 chi2.c 
	make -f Makefile
	ls -lF
	rm *.o
	mv baseml basemlg codeml pamp evolver yn00 chi2 ../bin
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/{$pkgname,licenses/$pkgname}}
	cd "$pkgname-$pkgver"
	cp bin/* $pkgdir/usr/bin
	cp -r doc/ $pkgdir/usr/share/$pkgname
	cp    LICENSE $pkgdir/usr/share/licenses/$pkgname
	cp -r Technical $pkgdir/usr/share/$pkgname
}

