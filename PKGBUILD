# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Original maintainer: Lakota Morris <lakota.james@gmail.com>
pkgname=mcskinedit
pkgver=alpha3pre7
pkgrel=2
pkgdesc="Minecraft Skin Editor"
arch=(any)
license=(unknown)
changelog=ChangeLog
url='http://www.minecraftforum.net/topic/3796-skinedit-new-version-13-april-alpha-3-pre-7/#entry49969'
depends=('java-runtime')
source=('http://orcsinthebasement.com/tempDL/SkinEdit+Alpha+3+pre+7.zip'
        'mcskinedit'
        'mcskinedit.desktop'
        'https://dl.dropbox.com/u/15956363/skintest2.jar')
md5sums=('d55191ab04cef76faf7d3a5c4bee288d'
         'c2b48f8d04d8470b78d7b288e3004fc7'
         '62b29f2419c85ce964fde86ded700f64'
         'ec418807008ad3f14d55db6457a693b8')

package() {
  # Extract icons
  cd "$srcdir" || return 1
  bsdcpio --extract --make-directories 'swedtech/mcskinedit/icons/icon_*px.png' < 'MCSkinEdit.jar'
  cd 'swedtech/mcskinedit/icons/'
  rename 'icon_' "${pkgname}_" *.png

  # Install the files their proper places
  cd "$srcdir" || return 1
  install -d $pkgdir/usr/bin
  install -m755 -t $pkgdir/usr/bin mcskinedit
  install -d $pkgdir/usr/share/$pkgname
  install -m644 -t $pkgdir/usr/share/$pkgname MCSkinEdit.jar skintest2.jar
  install -d $pkgdir/usr/share/$pkgname/parts
  install -m644 -t $pkgdir/usr/share/$pkgname/parts parts/*
  install -d $pkgdir/usr/share/$pkgname/backgrounds
  install -m644 -t $pkgdir/usr/share/$pkgname/backgrounds backgrounds/*
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 -t $pkgdir/usr/share/doc/$pkgname readme.txt
  install -d $pkgdir/usr/share/pixmaps
  install -m644 -t $pkgdir/usr/share/pixmaps swedtech/mcskinedit/icons/*.png
  install -d $pkgdir/usr/share/applications
  install -m644 -t $pkgdir/usr/share/applications mcskinedit.desktop
}

# vim:set ts=4 sw=4 et:
