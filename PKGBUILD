# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=paml
pkgver=4.10.10
pkgrel=1
pkgdesc="Phylogenetic analysis by maximum likelihood"
arch=('x86_64')
url="https://github.com/abacus-gene/paml"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('make')
source=("https://github.com/abacus-gene/paml/archive/refs/tags/v${pkgver}.zip")
sha256sums=('92ca1de12797d757472dc2ac04576dd629dbb8c447368c152f6a5a72c0c42fc1')
prepare(){
	cd "$pkgname-$pkgver"/
	mkdir -p bin
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
	make -f Makefile -j1
	ls -lF
	rm *.o
	mv baseml basemlg codeml pamp mcmctree evolver yn00 chi2 ../bin
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/{$pkgname,licenses/$pkgname}}
	cd "$pkgname-$pkgver"
	cp bin/* $pkgdir/usr/bin
	cp -r doc/ $pkgdir/usr/share/$pkgname
	cp    LICENSE $pkgdir/usr/share/licenses/$pkgname
	cp -r Technical $pkgdir/usr/share/$pkgname
}

