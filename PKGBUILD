# Maintainer: Ohio2 <sekmartyna4@gmail.com>
# (forked from)Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="ohio2-nerdfetch"
pkgver=4.02.1
pkgrel=00
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
optdepends=('bc: memory percent')
url="https://github.com/Ohio2/NerdFetch-Ohio2"
license=('GPL')
makedepends=('git')
makedepends=('gzip')
source=("git+https://github.com/Ohio2/NerdFetch")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd NerdFetch
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	if ! which dc &> /dev/null; then
		echo "Looks like you don't have bc (or your path is wonky)! The program will work, but you won't get the memory percent."
	fi
	cd NerdFetch
}

package() {
  install -Dm755 "$srcdir"/NerdFetch/"Arch and Arch-based"/nerdfetch "$pkgdir"/usr/bin/nerdfetch-ohio2
  install -Dm644 "$srcdir/NerdFetch/doc" "$pkgdir/usr/local/man/man1/nerdfetch-ohio2.1"
  gzip "$pkgdir"/usr/local/man/man1/nerdfetch-ohio2.1 
}
