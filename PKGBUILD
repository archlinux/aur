# Maintainer: Andreas Louv <andreas@louv.dk>

pkgname=rpglefmt-git
pkgver=0.0.4
pkgrel=1
pkgdesc="Format Free Form ILE RPG programs"
arch=("any")
url="https://github.com/andlrc/rpglefmt"
license=("GNU")
depends=()
makedepends=("git" "make")
provides=("rpglefmt")
source=('rpglefmt::git+git://github.com/andlrc/rpglefmt#branch=master')
md5sums=("SKIP")

pkgver()
{
	cd "$srcdir/${pkgname%-git}"
	sed 's/^#define.*VERSION.*"\(.*\)".*/\1/p;d' rpglefmt.c
}

package()
{
	cd "$srcdir/${pkgname%-git}"
	make CFLAGS="-O2 -DFEAT_ICEBREAK" rpglefmt
	install -D rpglefmt $pkgdir/usr/bin/rpglefmt
	install -Dm644 rpglefmt.1 $pkgdir/usr/share/man/man1/rpglefmt.1
}
