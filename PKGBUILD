# Maintainer: Manhong Dai <daimh@umich.edu>
pkgname=daisync-git
pkgver=r10.6624ef3
pkgrel=1
pkgdesc="an rsync-based time-machine backup tool"
arch=('any')
url="https://github.com/daimh/daisync"
license=('GPL')
groups=()
depends=(
	'coreutils'
	'bc'
	'util-linux'
	'rsync'
	'psmisc'
)
makedepends=('git')
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
	rm -f man/daisync.1.gz
	gzip man/daisync.1
}
check() {
	$pkgname/scripts/daisync -h || echo -n
}
package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -Dm755 $pkgname/scripts/daisync* "$pkgdir/usr/bin/"
	install -Dm644 $pkgname/man/daisync.1.gz "$pkgdir/usr/share/man/man1/daisync.1.gz"
}
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
