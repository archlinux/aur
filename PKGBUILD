# Maintainer: ewolnux <thinux@gmx.fr>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: aaditya <aaditya_gnulinux@zoho.com>

pkgname=gadmin-rsync
pkgver=0.1.9
pkgrel=3
pkgdesc="An easy to use GTK+ frontend for the rsync backup client and server."
arch=("i686" "x86_64")
url="http://dalalven.dtdns.net/linux/gadmintools-webpage/"
license=("GPL")
depends=("gtk2" "rsync" "openssh")
optdepends=("gksu: for running from menu")
options=(!emptydirs)
source=(http://dalalven.dtdns.net/linux/gadmin-rsync/gadmin-rsync-0.1.9.tar.gz)
md5sums=('9ea479cdeeb5a831b9df4c8cc92faa41')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
	# Use gksu in desktop file
	sed -i 's/Exec=gadmin-rsync/Exec=gksu gadmin-rsync/' desktop/$pkgname.desktop
	install -D -m755 desktop/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENCE
}
