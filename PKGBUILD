# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Dietrich <shaddow2k@@gmail..com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=imageenlarger
pkgver=0.9.1
pkgrel=1
pkgdesc="Small graphical tool (based on Qt) to resize, especially magnify bitmaps in high quality. (also called SmillaEnlarger)"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://sourceforge.net/projects/imageenlarger/"
# https://github.com/lupoDharkael/smilla-enlarger
# it seems that these are sources, latest commit on sourceforge svn was in 2010
depends=('qt5-base')
source=("https://downloads.sourceforge.net/project/imageenlarger/imageenlarger/SmillaEnlarger%20Release%20${pkgver}/SmillaEnlarger_${pkgver}_source.zip"
	SmillaEnlarger.desktop
	Qt5.11.patch)
	
prepare() {
	cd "${srcdir}/SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc/"
	# https://github.com/lupoDharkael/smilla-enlarger/issues/3#issuecomment-437664552
	patch -Np1 -i ../../Qt5.11.patch

}

build() {
	cd "${srcdir}/SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc/"
	qmake ImageEnlarger.pro
	make
}

package() {
	cd "${srcdir}/SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc/"
	
	# bin
	install -d "$pkgdir/usr/bin/"
	install -D -m755 SmillaEnlarger "$pkgdir/usr/bin/"

	#Desktop Launcher
	install -D -m644 "$srcdir/SmillaEnlarger.desktop" "$pkgdir/usr/share/applications/SmillaEnlarger.desktop"
	
	#Icon
	install -D -m644 smilla.ico "$pkgdir/usr/share/pixmaps/smilla.ico"
	install -D -m644 smilla.png "$pkgdir/usr/share/pixmaps/smilla.png"
}
md5sums=('4b3e5057236ab0688bb334a2faeb35d7'
         '294dac02f8e7d679acac375cd6f9aa28'
         'bfd357d3d4fdeea89da3dc74cd41a3d9')
