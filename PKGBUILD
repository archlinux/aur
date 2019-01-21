# Maintainer: Manhong Dai <daimh@umich.edu>
pkgname=mgrep-trie
pkgver=20190121
pkgrel=1
pkgdesc="print lines that match millions of strings efficiently"
arch=('x86_64')
url="http://brainarray.mbni.med.umich.edu/mgrep/"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=(gcc)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/daimh/mgrep.git)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums
build() {
	cd $pkgname
	./configure
	make
	rm -f man/mgrep.1.gz
	gzip man/mgrep.1
}
check() {
	$pkgname/src/mgrep --version
}
package() {
	install -Dm755 $pkgname/src/mgrep "$pkgdir/usr/bin/mgrep"
	install -Dm644 $pkgname/man/mgrep.1.gz "$pkgdir/usr/share/man/man1/mgrep.1.gz"
}
