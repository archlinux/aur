# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=nfs2se-git
pkgver=1.0.1
pkgrel=3
pkgdesc='Need For Speed II SE - Linux port with 3D acceleration and TCP protocol!'
arch=('i686' 'x86_64')
url='https://github.com/zaps166/NFSIISE'
license=('GPL')
depends=('sdl2' 'libgl')
makedepends=('gcc' 'yasm')
source=('git+https://github.com/zaps166/NFSIISE'
        'nfs2se')
md5sums=('SKIP'
         '50da45b125bd78839b60b9a16989c37f')
install=nfs2se-git.install

build()
{
	cd $srcdir/NFSIISE
	./compile_nfs
}

package()
{
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/nfs2se $pkgdir/usr/bin

	mkdir $pkgdir/opt
	cp -r "$srcdir/NFSIISE/Need For Speed II SE" $pkgdir/opt/nfs2se
	rm -f $pkgdir/opt/nfs2se/open_config.bat

	mkdir -p $pkgdir/usr/share/applications
	mv $pkgdir/opt/nfs2se/nfs2se.desktop $pkgdir/usr/share/applications

	mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
	mv $pkgdir/opt/nfs2se/nfs2se.png $pkgdir/usr/share/icons/hicolor/32x32/apps
}
