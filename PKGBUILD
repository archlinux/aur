# Maintainer: SanskritFritz (gmail)
# Contributor: yuntan_t (AUR)

pkgname=timeoutd
pkgver=1.5u10.1
pkgrel=4
pkgdesc="Flexible user timeout daemon. Enforces user login restrictions."
arch=('i686' 'x86_64')
url="https://github.com/sohonet/timeoutd"
license=('GPL')
depends=('libx11' 'libxext' 'libxss')
backup=('etc/timeouts')
source=('https://github.com/sohonet/timeoutd/archive/master.zip'
        'makefile_arch.patch'
        'timeoutd.service')

prepare() {
	cd "$srcdir/timeoutd-master"
	patch -p0 < "$srcdir/makefile_arch.patch"
}

build() {
	cd "$srcdir/timeoutd-master"
	make
}

package() {
	cd "$srcdir/timeoutd-master"
	install -Dm0755 timeoutd "$pkgdir/usr/bin/timeoutd"
	install -Dm0644 timeouts "$pkgdir/etc/timeouts"
	install -Dm0644 timeoutd.8 "$pkgdir/usr/share/man/man8/timeoutd.8"
	install -Dm0644 timeouts.5 "$pkgdir/usr/share/man/man5/timeouts.5"
	cd "$srcdir"
	install -Dm0644 timeoutd.service "$pkgdir/usr/lib/systemd/system/timeoutd.service"
}

md5sums=('48ba0c3cdc6446ce8536109aad10e726'
         '6f8a7ac7b8abdd40f04264ad132a81e6'
         'ae68577854b73a906451856f5ccbf809')
