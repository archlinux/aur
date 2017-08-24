# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Justin R. St-Amant <jstamant24 at gmail dot com>

pkgname=draftsight
pkgver=2017SP03
pkgrel=1
pkgdesc="Freeware CAD software for DWG/DXF files."
arch=('x86_64')
url="http://www.3ds.com/products/$pkgname/"
license=('custom')
depends=('alsa-lib'
         'desktop-file-utils'
         'fontconfig'
         'gcc-libs'
         'glib2'
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
         'postgresql-libs'
         'qt5-base'
         'qt5-x11extras'
         'zlib')
source=("http://dl-ak.solidworks.com/nonsecure/$pkgname/$pkgver/draftSight.rpm"
        "$pkgname.desktop")
md5sums=('0e479cf3b6c9ef8511cf3e4ebcabc4ff'
         '19b26d423cae7ec0e1e6c6d78c94915d')

_pkgprefix='opt/dassault-systemes/DraftSight'

package() {
  mkdir -p $pkgdir/usr/bin
  echo "#!/bin/sh" > $pkgdir/usr/bin/$pkgname
  echo "env vblank_mode=0 /$_pkgprefix/Linux/DraftSight" >> $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname

  mkdir -p $pkgdir/$_pkgprefix
  cd $srcdir/$_pkgprefix
  install -Dm644 Eula/english/eula.htm $pkgdir/usr/share/licenses/$pkgname/LICENSE

  for size in "16x16" "32x32" "48x48" "64x64" "128x128"
  do
    install -Dm644 Resources/pixmaps/$size/program.png $pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png
    install -Dm644 Resources/pixmaps/$size/file-dwg.png $pkgdir/usr/share/icons/hicolor/$size/mimetypes/file-dwg.png
    install -Dm644 Resources/pixmaps/$size/file-dxf.png $pkgdir/usr/share/icons/hicolor/$size/mimetypes/file-dxf.png
    install -Dm644 Resources/pixmaps/$size/file-dwt.png $pkgdir/usr/share/icons/hicolor/$size/mimetypes/file-dwt.png
  done

  install -Dm644 Resources/dassault-systemes_$pkgname-dwg.xml $pkgdir/usr/share/mime/application/dassault-systemes_$pkgname-dwg.xml
  install -Dm644 Resources/dassault-systemes_$pkgname-dxf.xml $pkgdir/usr/share/mime/application/dassault-systemes_$pkgname-dxf.xml
  install -Dm644 Resources/dassault-systemes_$pkgname-dwt.xml $pkgdir/usr/share/mime/application/dassault-systemes_$pkgname-dwt.xml

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Install Draftsight's program files
  cp -pr $srcdir/$_pkgprefix/* $pkgdir/$_pkgprefix/
}
