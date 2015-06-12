# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=caster-demo
pkgver=1.3.1
pkgrel=2
pkgdesc="an intense 3rd person action shooter with massive terrain deformation and explosive attacks (demo version)"
arch=('i686' 'x86_64')
url="http://elecorn.com/caster3d/"
license=("custom:free_demo")
install="caster-demo.install"
source=('caster-demo.desktop')
md5sums=('844c2728d0a31959876bbde3dbb4d151')

[ "$CARCH" = "i686"   ] && source=(${source[@]} "http://www.elecorn.com/caster3d/data/caster-1.3.1-i386-demo-installer.bin") && md5sums=(${md5sums[@]} 'f6cf4c1cab03f69a399108970cd77a93')
[ "$CARCH" = "x86_64" ] && source=(${source[@]} "http://www.elecorn.com/caster3d/data/caster-1.3.1-amd64-demo-installer.bin") && md5sums=(${md5sums[@]} '38f7e73507125319773bbc852ff75c9c')

noextract=('caster-1.3.1-i386-demo-installer.bin' 'caster-1.3.1-amd64-demo-installer.bin')
makedepends=('wget' 'unzip')
depends=('libx11' 'libpng12')

build() {
true
}

package() {
  mkdir -p $pkgdir/usr/{share/caster-demo,bin}
  cd $srcdir/
  unzip *bin || true
  cd data/caster_linux
  #/bin/tar cf - * | ( cd ../../../pkg/usr/share/caster-demo/; tar xfp - )
  cp -pR . $pkgdir/usr/share/caster-demo
(echo "#!/bin/bash
cd /usr/share/caster-demo
./caster.bin \"\$@\"") > $pkgdir/usr/bin/caster-demo
  chmod 755 $pkgdir/usr/bin/caster-demo
  install -D -m644 caster_icon.png $pkgdir/usr/share/pixmaps/caster_icon.png
  install -D -m644 $srcdir/caster-demo.desktop $pkgdir/usr/share/applications/caster-demo.desktop
}
