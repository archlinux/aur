# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname="bsdsed"
_freebsd_ver="14.1.0"
pkgver="$_freebsd_ver"
pkgrel=2
pkgdesc="BSD variant of sed"
arch=('x86_64')
url="https://github.com/freebsd/freebsd-src/tree/main/usr.bin/sed"
license=('BSD')
depends=('glibc')
source=("https://github.com/freebsd/freebsd-src/archive/refs/tags/release/$_freebsd_ver.tar.gz"
        "Makefile"
        "errc.c"
        "linux_compat.h")
sha256sums=('87e1968215be2e0ec5a8e30bf79f227399608a4e8e16af697f12e0ab34fcb5bf'
            '3be02db91c77bd883f16d37b5a07a6c5bfe5f42ef80fa63cc68d3faed9a8803e'
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
