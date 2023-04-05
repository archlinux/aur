# Maintainer: batot <archpackage@algrim.pl>
# Contributor: batot <archpackage@algrim.pl>
packager="batot <archpackage@algrim.pl>"
pkgname=netatop-lts
_pkgname=netatop
pkgver=3.1
pkgrel=1
pkgdesc="Atop network kernel module, enables network statistics in atop"
url="http://www.atoptool.nl/"
groups=('modules')
license=('GPL')
install='depmod.install'
depends=('atop')
provides=("netatop")
conflicts=("netatop")
makedepends=('linux-lts-headers')
source=("http://atoptool.nl/download/netatop-$pkgver.tar.gz")
sha256sums=('736f43572c31a90748f023f0a5a814bff58d44c0c3f060d776cfd6e6e8435c62')
arch=('x86_64' 'i386')


build() {
	cd $srcdir/$_pkgname-$pkgver

	make all
}

package() {
	cd $srcdir/$_pkgname-$pkgver

	install -Dm 0744 module/netatop.ko $pkgdir/usr/lib/modules/$(uname -r)/extramodules/netatop.ko

	install -D daemon/netatopd $pkgdir/usr/bin/netatopd

	install -D man/netatop.4 $pkgdir/usr/share/man/man4/netatop.4
	install -D man/netatopd.8 $pkgdir/usr/share/man/man8/netatopd.8

	mkdir -p $pkgdir/etc/modules-load.d

	echo "netatop" > $pkgdir/etc/modules-load.d/netatop.conf
}
