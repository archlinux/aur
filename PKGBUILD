# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=scratch2
_ver=437
pkgver="2.0.$_ver"
pkgrel=1
pkgdesc="With Scratch, you can program your own interactive stories, games, and animations"
arch=('i686' 'x86_64')
url="https://scratch.mit.edu"
license=('GPL')
depends=('adobe-air')
makedepends=('unzip')
source=("https://scratch.mit.edu/scratchr2/static/sa/Scratch-$_ver.air" "$pkgname.desktop" "$pkgname.png")
sha1sums=('aab72b0217fe4fda9dcdbf94637ff48617211cfa'
			'1f38f3a41cd256f3d34fc2dbefcc290681160109'
			'bfca77daa1a9079f2197d98509ca4a33b3246df1')
noextract=("Scratch-$_ver.air")

package() {
  mkdir $srcdir/$pkgname
  unzip Scratch-$_ver.air -d $srcdir/$pkgname

  install -dm 755 $pkgdir/opt/airapps/
  cp -r $srcdir/$pkgname $pkgdir/opt/airapps/$pkgname
  chmod -R 755 $pkgdir/opt/airapps/$pkgname

  install -dm 755 $pkgdir/usr/bin
  echo "#!/bin/bash" >> $pkgdir/usr/bin/$pkgname
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/$pkgname/META-INF/AIR/application.xml /opt/airapps/$pkgname/" >> $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname

  install -Dm 644 "$pkgname.desktop" $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 "$pkgname.png" $pkgdir/usr/share/pixmaps/$pkgname.png
}
