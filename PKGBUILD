# Original Maintainer: Difarem <difarem@gmail.com>
# Forked by: Sterophonick

pkgname=j0cc-famitracker
_pkgname='j0CC-FamiTracker'
pkgver=0.6.3
pkgrel=1
pkgdesc="Fork of HertzDevil's 0CC-FamiTracker containing various bugfixes and Namco N163 improvements."
url='https://github.com/nyanpasu64/j0CC-FamiTracker/'
arch=(x86_64)
depends=(wine)
makedepends=(p7zip)
_filename=j0CC-Famitracker-0.6.3
source=(https://github.com/nyanpasu64/j0CC-FamiTracker/releases/download/0.6.3/j0CC-Famitracker-0.6.3.exe
        https://raw.githubusercontent.com/Sterophonick/sterophonick.github.io/master/images/0cc-famitracker.png)
noextract=($filename.exe)
md5sums=('b95f72c253232f72fc504748e44f5c96' 'f68aef841cc2692f1d6b47dae40da447')
license=('GPLv2')

package() {
  cd $srcdir
  
  mkdir "${pkgdir}/usr"
  mkdir "${pkgdir}/usr/bin"
  mkdir "${pkgdir}/usr/share"
  mkdir "${pkgdir}/usr/share/pixmaps"
  mkdir "${pkgdir}/usr/share/applications"
  mkdir "${pkgdir}/usr/share/j0cc-famitracker"
	
  install -Dm644 0cc-famitracker.png $pkgdir/usr/share/pixmaps/j0cc-famitracker.png
  
  cp -rT $_filename.exe $pkgdir/usr/share/j0cc-famitracker/$_filename.exe
  
  printf "[Desktop Entry]\nEncoding=UTF-8\nType=Application\nName=j0CC-FamiTracker\nComment=Fork of HertzDevil's 0CC-FamiTracker containing various bugfixes and Namco N163 improvements.\nExec=j0cc-famitracker\nIcon=j0cc-famitracker\nTerminal=false\nStartupNotify=false\nCategories=Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;;\n" >> "${pkgdir}/usr/share/applications/j0cc-famitracker.desktop"
  
  printf '#!/bin/bash\n\nWINEPREFIX=~/.j0cc-famitracker wine /usr/share/j0cc-famitracker/j0CC-Famitracker-0.6.3.exe "$@"' >> "${pkgdir}/usr/bin/j0cc-famitracker"
  
  chmod +x "${pkgdir}/usr/bin/j0cc-famitracker"

}
