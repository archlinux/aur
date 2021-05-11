# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
pkgname=deflemask
pkgver=0.12.1
pkgrel=5
pkgdesc="A Multi-System music tracker (Genesis/MegaDrive, NES/Famicom (nsf), Commodore 64 (sid), and many others)"
arch=('i686' 'x86_64')
url='https://deflemask.com'
license=('unknown')

depends=(freeglut unionfs-fuse)
depends_i686=(sdl gtk2 glu libglvnd libao)
depends_x86_64=(lib32-sdl lib32-gtk2 lib32-glu lib32-libglvnd lib32-libao)

_tarfile=DefleMask_Legacy_Linux.tar.gz
_tarlink=https://www.deflemask.com/$_tarfile
source=($_tarlink
        launcher.sh
        deflemask.desktop)

md5sums=('d6b52441a2abc5cd15d55b22d564c592'
         '81d19468cae85f038ad2999bebc2f026'
         '98d2e13db3f8902dd697b6fab5235b4e')

package() {
	install -d $pkgdir/opt/$pkgname

	# copy tarbombed src
	cp -r $srcdir/* $pkgdir/opt/$pkgname/

	# fix perms
	chmod -R 755 $pkgdir/opt/$pkgname/

	# remove tarfile files
	rm $pkgdir/opt/$pkgname/$_tarfile

	install -Dm644 "$srcdir/deflemask.desktop" "$pkgdir/usr/share/applications/deflemask.desktop"
	install -Dm644 "$pkgdir/opt/deflemask/extras/icon.png" "$pkgdir/usr/share/pixmaps/deflemask.png"

	install -D $srcdir/launcher.sh $pkgdir/opt/$pkgname

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/launcher.sh $pkgdir/usr/bin/$pkgname
}
