# Maintainer: SanskritFritz (gmail)

pkgname=timeoutd
pkgver=1.5deb10.1
pkgrel=2
pkgdesc="Flexible user timeout daemon. Enforces user login restrictions."
arch=('i686' 'x86_64')
url="http://packages.debian.org/squeeze/timeoutd"
license=('GPL')
depends=('libx11' 'libxext' 'libxss')
backup=('etc/timeouts')
source=('http://ftp.de.debian.org/debian/pool/main/t/timeoutd/timeoutd_1.5.orig.tar.gz'
	'http://ftp.de.debian.org/debian/pool/main/t/timeoutd/timeoutd_1.5-10.1.diff.gz'
	'makefile_arch.patch'
	'timeoutd.service')

build() {
	cd "$srcdir/timeoutd-1.5.orig"
	patch -p1 < "../timeoutd_1.5-10.1.diff"
	patch -p0 < "$srcdir/makefile_arch.patch"
	make
}

package() {
	cd "$srcdir/timeoutd-1.5.orig"
	install -Dm0755 timeoutd "$pkgdir/usr/bin/timeoutd"
	install -Dm0644 timeouts "$pkgdir/etc/timeouts"
	install -Dm0644 timeoutd.8 "$pkgdir/usr/share/man/man8/timeoutd.8"
	install -Dm0644 timeouts.5 "$pkgdir/usr/share/man/man5/timeouts.5"
	cd "$srcdir"
	install -Dm0644 timeoutd.service "$pkgdir/usr/lib/systemd/system/timeoutd.service"
}

md5sums=('0be669e0111575fc5bbc8f20e27e4f88'
         '2c1ecc3417d81cda99705078244bd3e7'
         '6f8a7ac7b8abdd40f04264ad132a81e6'
         '8ced5cbe1e96e0f35e240858c1b21fb6')

