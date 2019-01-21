# Maintainer: Manhong Dai <daimh@umich.edu>
pkgname=mgrep
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
	rm -f man/$pkgname.1.gz
	gzip man/$pkgname.1
}
check() {
	$pkgname/src/$pkgname --version
}
package() {
	install -Dm755 $pkgname/src/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname/man/$pkgname.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
