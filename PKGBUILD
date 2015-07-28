# Contributor: twa022 <twa022 at gmail dot com>

pkgname=jdip
pkgver=1.7.0pre1
pkgrel=2
pkgdesc="A diplomacy game implemented in Java"
arch=('i686' 'x86_64')
url="http://jdip.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/jdip/jdip/jdip%201.7.0%20preview%201/jdip-1.7.0-preview-1-bin-noinstaller.zip")
noextract=("jdip-1.7.0-preview-1-bin-noinstaller.zip")
sha256sums=('fba5e788dad246aff763f507202069eeec3703e1c91b60936e4c923e1715f916')

package () {
  mkdir -p "$pkgdir/usr/lib/"
  bsdtar -x -f "${srcdir}/jdip-1.7.0-preview-1-bin-noinstaller.zip" -C "$pkgdir/usr/lib/"
  mkdir "$pkgdir/usr/bin"
  sed -i -e 's/.$//' -e 's:/bin/sh:/bin/bash:' "$pkgdir/usr/lib/jdip/jdip.sh"
  chmod 755 "$pkgdir/usr/lib/jdip/jdip.sh"
  cat > "$pkgdir/usr/bin/jdip" <<- __EOF__
	#!/bin/bash
	cd "/usr/lib/jdip"
	./jdip.sh
	exit 0
	__EOF__
  chmod 755 "$pkgdir/usr/bin/jdip"
  
  mkdir -p ${pkgdir}/usr/share/pixmaps
  ln -s /usr/lib/jdip/images/h31_h32_thumb.png ${pkgdir}/usr/share/pixmaps/jdip.png
  
  mkdir -p "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/jdip.desktop" <<- __EOF__
	[Desktop Entry]
	Encoding=UTF-8
	Name=jDip
	Exec=jdip
	Icon=jdip
	Terminal=false
	Type=Application
	Categories=Game;
	StartupNotify=false
	Comment=Diplomacy Game implemented in Java
	GenericName=Diplomacy
	__EOF__
  
}
