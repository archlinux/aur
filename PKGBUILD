# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=dukto
pkgver=R6+r111
pkgrel=1
pkgdesc="A simple, fast and multi-platform file transfer tool for LAN users."
arch=('any')
url="http://sourceforge.net/projects/dukto"
license=('GPLv2')
depends=('qt5-quick1' 'qt5-script' 'qt5-xmlpatterns')
makedepends=('subversion')
# conflicts=('')
source=("$pkgname"::'svn+http://svn.code.sf.net/p/dukto/code/trunk')
sha256sums=('SKIP')

pkgver() {

      cd "$srcdir/$pkgname"

      local ver="$(svnversion)"
      printf "R6+r%s" "${ver//[[:alpha:]]}"

}

build()
{

	    cd "$srcdir/$pkgname"

	    msg2 "  -> Build program..."
	    qmake-qt4 $pkgname.pro
	    make

}

package (){
  
	cd "$srcdir/$pkgname"

    	msg2 "  -> Installing program..."
  	  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

    	msg2 "  -> Installing icons..."
  	  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    	msg2 "  -> Installing .desktop file..."
    	echo "[Desktop Entry]
    	Version=1.0
    	Encoding=UTF-8
    	Type=Application
	    Name=Dukto
    	GenericName=Transfer files across the LAN
    	Comment=Transfer files across the LAN
    	Exec=$pkgname
    	Icon=$pkgname.png
    	StartupNotify=true
    	Terminal=false 
    	Categories=Network;Application;" | tee "$pkgname.desktop"
    	echo -e "...Ok.\n"

    	install -Dm644  "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

}

# vim: ts=2 sw=2 et:
