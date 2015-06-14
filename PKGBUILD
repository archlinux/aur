# Maintainer: gls < ghostlovescorebg at gmail dot com >
# Contributor: muunleit < muunleit at lavabit dot com >

pkgname=lxdvdrip
pkgver=1.77
pkgrel=1
pkgdesc="Rip/reauthor/burn DVDs"
url="http://sourceforge.net/projects/lxdvdrip/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dvd+rw-tools' 'dvdauthor' 'libdvdnav' 'libdvdread' 'transcode')
optdepends=('dvdwizard')
makedepends=('libdvdread')
conflicts=('mpgtx')
provides=('mpgtx')
source=("http://downloads.sourceforge.net/project/lxdvdrip/lxdvdrip-${pkgver}.tgz")
md5sums=('21623398f37b639d8ef5bb79a8911eb5')

build() {
	cd $srcdir/$pkgname
	make
}

package() {
	# Create pkgdir folders
	install -d $pkgdir/etc
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share
	install -d $pkgdir/usr/share/man/man1
	install -d $pkgdir/usr/share/$pkgname
	install -d $pkgdir/usr/share/doc/$pkgname

	# modified content of lxdvdrip Makefile
	cd $srcdir/$pkgname
	cp -a lxdvdrip        $pkgdir/usr/bin
	cp -a lxac3scan       $pkgdir/usr/bin
	cp -a lxdvdrip.1      $pkgdir/usr/share/man/man1
	cp -a lxdvdrip.wav    $pkgdir/usr/share/$pkgname
	cp -a doc-pak/*       $pkgdir/usr/share/doc/$pkgname
	cp -a lxdvdrip.conf   $pkgdir/etc

	cd vamps      && make PREFIX=$pkgdir/usr install      && cd ..
	cd dvdbackup  && make PREFIX=$pkgdir/usr install      && cd ..
	cd requant    && make PREFIX=$pkgdir/usr install      && cd ..
	cd mbuffer    && make INSTBIN=$pkgdir/usr/bin install && cd ..
}
