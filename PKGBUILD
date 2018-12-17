# Maintainer: Spider.007 <archPackage@spider007.net>
# Contributor: Spider.007 <archPackage@spider007.net>
packager="Spider.007 <archPackage@spider007.net>"
pkgname=netatop
pkgver=2.0
pkgrel=1
pkgdesc="Atop network kernel module, enables network statistics in atop"
url="http://www.atoptool.nl/"
groups=('modules')
license=('GPL')
install='depmod.install'
depends=('atop')
makedepends=('linux-headers')
source=("http://atoptool.nl/download/netatop-$pkgver.tar.gz")
sha256sums=('c66d7ca094d667428924f2faff2afb816b17565e8c3628e43bfa0e1a2e22c20e')
arch=('x86_64' 'i386')

build() {
	cd $srcdir/$pkgname-$pkgver

	make all
}

package() {
	cd $srcdir/$pkgname-$pkgver

	install -Dm 0744 module/netatop.ko $pkgdir/usr/lib/modules/extramodules-ARCH/netatop.ko

	install -D daemon/netatopd $pkgdir/usr/bin/netatopd

	install -D man/netatop.4 $pkgdir/usr/share/man/man4/netatop.4
	install -D man/netatopd.8 $pkgdir/usr/share/man/man8/netatopd.8

	mkdir -p $pkgdir/etc/modules-load.d

	echo "netatop" > $pkgdir/etc/modules-load.d/netatop.conf
}
