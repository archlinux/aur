# Maintainer: Manhong Dai <daimh@umich.edu>
pkgname=daisync
pkgver=20190124
pkgrel=1
pkgdesc="an rsync-based time-machine backup tool"
arch=('any')
url="https://github.com/daimh/$pkgname"
license=('GPL')
groups=()
depends=(
	'coreutils'
	'bc'
	'util-linux'
	'rsync'
	'psmisc'
)
makedepends=()
optdepends=(
	'gnuplot: plotting support'
	'mlocate'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+$url.git)
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
	$pkgname/scripts/$pkgname -h || echo -n
}
package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -Dm755 $pkgname/scripts/$pkgname* "$pkgdir/usr/bin/"
	install -Dm644 $pkgname/man/$pkgname.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
