# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=nfs2se-git
pkgver=1.0.2
pkgrel=1
pkgdesc='Cross-platform wrapper for the Need For Speed™ II SE game with 3D acceleration and TCP protocol!'
arch=('i686' 'x86_64')
url='https://github.com/zaps166/NFSIISE'
license=('MIT')

if [ $(uname -m) == "x86_64" ]; then
	depends=('lib32-sdl2' 'lib32-libgl')
	makedepends=('gcc-multilib' 'curl')
else
	depends=('sdl2' 'libgl')
	makedepends=('gcc' 'curl')
fi

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
