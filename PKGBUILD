# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>

pkgname=draftsight
pkgver=2017SP0
pkgrel=2
pkgdesc="Freeware CAD software for your DWG/DXF files."
arch=('x86_64')
url="http://www.3ds.com/products/draftsight/"
license=('custom')
depends=('alsa-lib'
         'desktop-file-utils'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'gstreamer0.10-base'
         'gtk2'
         'libcups'
         'libgl'
         'libice'
         'libmariadbclient'
         'libmng'
         'libpng12'
         'libsm'
         'libx11'
         'libxext'
         'libxrender'
         'libxslt'
         'mesa'
         'postgresql-libs'
         'qt5-base'
         'qt5-x11extras'
         'zlib')
source=("http://www.draftsight.com/download-linux-fedora"
        "draftsight.desktop")
md5sums=('7052ab4354064a41bc008130df4a719b'
         '19b26d423cae7ec0e1e6c6d78c94915d')

_pkgprefix='opt/dassault-systemes/DraftSight'

package()
{
  mkdir -p $pkgdir/usr/bin
  echo "#!/bin/sh" > \
       $pkgdir/usr/bin/draftsight
  echo "env vblank_mode=0 /${_pkgprefix}/Linux/DraftSight" >> \
       $pkgdir/usr/bin/draftsight
  chmod 755 $pkgdir/usr/bin/draftsight

  mkdir -p $pkgdir/$_pkgprefix
  cd $srcdir/$_pkgprefix
  install -Dm644 Eula/english/eula.htm $pkgdir/usr/share/licenses/draftsight/LICENSE
  for size in "16x16" "32x32" "48x48" "64x64" "128x128"
  do
    install -Dm644 Resources/pixmaps/$size/program.png $pkgdir/usr/share/icons/hicolor/$size/apps/draftsight.png
    install -Dm644 Resources/pixmaps/$size/file-dwg.png $pkgdir/usr/share/icons/hicolor/$size/mimetypes/file-dwg.png
    install -Dm644 Resources/pixmaps/$size/file-dxf.png $pkgdir/usr/share/icons/hicolor/$size/mimetypes/file-dxf.png
    install -Dm644 Resources/pixmaps/$size/file-dwt.png $pkgdir/usr/share/icons/hicolor/$size/mimetypes/file-dwt.png
  done
  install -Dm644 Resources/dassault-systemes_draftsight-dwg.xml $pkgdir/usr/share/mime/application/dassault-systemes_draftsight-dwg.xml
  install -Dm644 Resources/dassault-systemes_draftsight-dxf.xml $pkgdir/usr/share/mime/application/dassault-systemes_draftsight-dxf.xml
  install -Dm644 Resources/dassault-systemes_draftsight-dwt.xml $pkgdir/usr/share/mime/application/dassault-systemes_draftsight-dwt.xml

  install -Dm644 $srcdir/draftsight.desktop $pkgdir/usr/share/applications/draftsight.desktop

  #Install Draftsight's program files
  cp -pr $srcdir/$_pkgprefix/* $pkgdir/$_pkgprefix/
}
