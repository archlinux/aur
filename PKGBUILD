# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
pkgname=deflemask
pkgver=0.12.0
pkgrel=3
pkgdesc="A Multi-System music tracker (Genesis/MegaDrive, NES/Famicom (nsf), Commodore 64 (sid), and many others)"
arch=('i686' 'x86_64')
url='http://www.delek.com.ar/deflemask'
license=('unknown')

depends=(freeglut unionfs-fuse)
depends_i686=(sdl)
depends_x86_64=(lib32-sdl)

_tarfile=DefleMask_Linux.tar.gz
_tarlink=http://www.deflemask.com/$_tarfile
source=($_tarlink
        launcher.sh)
md5sums=('1865dbc78ec06bb098c4d0676354d830'
         '81d19468cae85f038ad2999bebc2f026')
package() {
	install -d $pkgdir/opt/$pkgname

	# copy tarbombed src
	cp -r $srcdir/* $pkgdir/opt/$pkgname/

	# fix perms
	chmod -R 755 $pkgdir/opt/$pkgname/

	# remove pre-tarbomb files
	rm $pkgdir/opt/$pkgname/{launcher.sh,$_tarfile}

	install -D $srcdir/launcher.sh $pkgdir/usr/bin/$pkgname
}
