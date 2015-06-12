# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=iverbs_bin
pkgver=0.5beta3
pkgrel=3
pkgdesc="Multiplatform irregular verbs learning tool"
arch=('i686')
url="http://iverbs.sourceforge.net"
license=('GPL')
depends=('gtk2')
source=("http://sourceforge.net/projects/iverbs/files/Linux%20-%20binary%20archive/0.5-beta3/iverbs_0.5-beta3_i386_bin.tar.gz" "iverbs.desktop")
md5sums=('1eda1305e2b5d6dcaf9d79123c21db42' '4f504c2a9d9bd64e77c9999faa70504a')

build() {
true
}

package() {
	# we want to have fresh database data
	svn co https://iverbs.svn.sourceforge.net/svnroot/iverbs/desktop/ || true
	cd $srcdir/
	install -D -m755 iverbs $pkgdir/usr/share/iverbs/iverbs
	install -D -m755 iverbs.sh $pkgdir/usr/bin/iverbs.sh
	mkdir -p $pkgdir/usr/share/iverbs/defaults/{,database,language}
	install -D -m644 defaults/* $pkgdir/usr/share/iverbs/defaults || true
	install -D -m644 desktop/database/* $pkgdir/usr/share/iverbs/defaults/database
	install -D -m644 defaults/language/* $pkgdir/usr/share/iverbs/defaults/language
	install -D -m644 desktop/icon.png $pkgdir/usr/share/pixmaps/iverbs.png
	install -D -m644 iverbs.desktop $pkgdir/usr/share/applications/iverbs.desktop
}
