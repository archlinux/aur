# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=touchosc-editor
pkgver=1.7.0
pkgrel=2
pkgdesc="Graphical editor to create and customise layouts for TouchOSC"
arch=('any')
url="http://hexler.net/"
license=('custom')
depends=('java-runtime' 'shared-mime-info' 'xdg-utils' 'desktop-file-utils' 'hicolor-icon-theme')
install="touchosc-editor.install"
source=(touchosc-editor.sh
	touchosc-editor.png
	touchosc-layout.png
	touchosc-editor.desktop
	touchosc-layout.xml
        "http://hexler.net/pub/touchosc/${pkgname}-${pkgver}-noarch.zip")
md5sums=('995e06cdb089cb2d06e5acfbc52b08ae'
         'da2cdaa9f48b2de1294200286d465387'
         'caa18a80902f10ced5062b2407c797ee'
         '7dbf615862f6e99e76e97ac2864531fc'
         '68b65fc0a09478d1b055d8c5efc59e58'
         'a5ccf8b74cb031f7e475534b261d8b6a')

package() {
  # Installing application
  cd $srcdir/$pkgname-$pkgver-noarch
  install -dm755 $pkgdir/usr/share/java/
  install -Dm644 TouchOSCEditor.jar $pkgdir/usr/share/java/

  # Installing launcher
  install -Dm755 $srcdir/touchosc-editor.sh $pkgdir/usr/bin/touchosc-editor

  # Installing icons
  install -dm755 $pkgdir/usr/share/icons/hicolor/128x128/{apps,mimetypes}
  install -Dm644 $srcdir/touchosc-editor.png $pkgdir/usr/share/icons/hicolor/128x128/apps
  install -Dm644 $srcdir/touchosc-layout.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes

  # Installing menu item
  install -Dm644 $srcdir/touchosc-editor.desktop $pkgdir/usr/share/applications/touchosc-editor.desktop

  # Installing mimetype
  install -Dm644 $srcdir/touchosc-layout.xml $pkgdir/usr/share/mime/packages/touchosc-layout.xml

  # Installing layouts
  install -dm755 $pkgdir/usr/share/doc/touchosc-editor/
  install -Dm644 layouts/* $pkgdir/usr/share/doc/touchosc-editor
}
