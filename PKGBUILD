# Maintainer: Hans-Nikolai Viessmann <hans@viess.mn>
pkgname="bsdsed"
_freebsd_ver="14.0.0"
pkgver="1.0.0"
pkgrel=1
pkgdesc="BSD variant of sed"
arch=('x86_64')
url="https://github.com/freebsd/freebsd-src/tree/main/usr.bin/sed"
license=('BSD')
depends=('glibc')
source=("https://github.com/freebsd/freebsd-src/archive/refs/tags/release/$_freebsd_ver.tar.gz"
        "Makefile"
				"errc.c"
				"linux_compat.h")
sha256sums=('ebdb7af04060d0a52e713bab4eba274ab2c9c6b94e657e67b32c80086ccbeabc'
            '394e15e993e651f98f5d0a7c69714f1a1b9870d500a9ead7616f0dfb1a34fddd'
            'ffa4df0805e86b6298758b0abd4857b189d2d8b4df0de510376efd064a3d5e64'
            '64c848535ea2af835c1cf3b24a0843408bc4ecd542ff660f023fe9413d6888c2')

build() {
	cd "$srcdir"
	make FREEBSDVER=$_freebsd_ver
}

package() {
	cd "$srcdir"
	make FREEBSDVER=$_freebsd_ver DESTDIR="$pkgdir/" install

	install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname/ freebsd-src-release-$_freebsd_ver/COPYRIGHT 
}
