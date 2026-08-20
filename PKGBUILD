# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=paml
pkgver=4.10.10
pkgrel=2
pkgdesc="Phylogenetic analysis by maximum likelihood"
arch=('x86_64')
url="https://github.com/abacus-gene/paml"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('make')
provides=("paml-bin=${pkgver}")
conflicts=('paml-bin')
source=("https://github.com/abacus-gene/paml/archive/refs/tags/v${pkgver}.zip")
sha256sums=('92ca1de12797d757472dc2ac04576dd629dbb8c447368c152f6a5a72c0c42fc1')
prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p bin
}

build() {
	cd "$pkgname-$pkgver/src"
	make -j1
	rm *.o
	mv baseml basemlg codeml pamp mcmctree evolver yn00 chi2 ../bin
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
	cp bin/* "$pkgdir/usr/bin"
	cp -r doc/ Technical/ "$pkgdir/usr/share/$pkgname/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

