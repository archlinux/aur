# Maintainer: Taigah Dev <taigah dot dev at gmail dot com>
_pkgname=minilibx
pkgname=minilibx-git
pkgver=r61.9cd1813
pkgrel=1
pkgdesc="A simple X-Window (X11R6) programming API in C suitable for X-beginners."
arch=("x86_64")
url="https://github.com/42Paris/minilibx-linux"
license=("BSD-2-Clause")
depends=()
makedepends=("git")
provides=("$_pkgname")
conflicts=()
source=("$_pkgname::git+https://github.com/42Paris/minilibx-linux")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	./configure
	make
}

package() {
	cd "$srcdir/$_pkgname"
  install -Dm644 libmlx.a "$pkgdir/usr/lib/libmlx.a"
  install -Dm644 mlx.h "$pkgdir/usr/include/mlx.h"
  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 man/man1/mlx*.1 "$pkgdir/usr/share/man/man1/"
  install -d "$pkgdir/usr/share/man/man3/"
  install -m644 man/man3/mlx*.3 "$pkgdir/usr/share/man/man3/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

