# Maintainer: jianingy <jianingy.yang AT gmail.com>
# Contributor: cmb <chris AT the-brannons.com>
# Contributor: hatred <hatred AT inbox.ru>

pkgname=daemontools
pkgrel=7
pkgver=0.76
pkgdesc='A collection of tools for managing UNIX services'
arch=(i686 x86_64 armv6h)
url='http://cr.yp.to/daemontools.html'
license=('public domain')
depends=('pacman')
backups=('/etc/inittab')
install=daemontools.install
source=(
	"http://cr.yp.to/daemontools/$pkgname-$pkgver.tar.gz"
	"http://smarden.org/pape/djb/manpages/$pkgname-$pkgver-man.tar.gz"
	'daemontools-0.76.errno.patch'
	'daemontools-0.76.svscanboot-path-fix.patch'
	'svscan.service'
)
md5sums=(
    '1871af2453d6e464034968a0fbcb2bfc'
	'2d3858a48f293c87202f76cd883438ee'
	'1ab80be37239e920542425baa8f1c5b9'
	'55ee6f55f01e9df3c432ac764875087e'
	'8915bb319b7cf68376ee51a356b87f88'
)

build() {
	cd admin/$pkgname-$pkgver
	patch -p1 < $srcdir/daemontools-0.76.errno.patch
	patch -p1 < $srcdir/daemontools-0.76.svscanboot-path-fix.patch
	package/compile
}

package() {
	cd admin/$pkgname-$pkgver
	install -d $pkgdir/usr/bin
	cp -a command/* $pkgdir/usr/bin
	install -d $pkgdir/usr/share/man/man8
	cp -a $srcdir/daemontools-man/* $pkgdir/usr/share/man/man8
	install -d $pkgdir/usr/lib/systemd/system
	install -m644 $srcdir/svscan.service $pkgdir/usr/lib/systemd/system
}
