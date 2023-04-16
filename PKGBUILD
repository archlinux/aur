# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=outfox_bin
#      main  date     sub  codename
pkgver=5.3.0_20230415_4.19_LTS
read main date sub codename <<< $(echo "${pkgver}" | sed 's/_/ /g')
pkgrel=1
pkgdesc="fork of open source rhythm game engine StepMania"
arch=('x86_64')
options=('!strip')
url="https://projectmoon.dance/index.php"
license=('Apache')
depends=('libusb-compat' 'ffmpeg' 'lua')
makedepends=(gendesk)
source=("https://github.com/TeamRizu/OutFox/releases/download/OF${sub}.0/OutFox-0.${sub}-${codename}-Linux-amd64-.20.04+.-modern-date-${date}.tar.gz"
        "outfox.sh"
        "outfox.png")

prepare() {
  cd $srcdir
  gendesk -f -n --pkgname outfox --pkgdesc "${pkgdesc}" --exec "outfox" --categories "Game;AudioVideo;ArcadeGame"
}


package() {
  install -dm755 $pkgdir/usr/share/outfox $pkgdir/usr/share/doc/outfox
  cd $srcdir/OutFox-alpha-0.${sub}-amd64-modern-date-${date}
  cp -R . $pkgdir/usr/share/outfox
  mv $pkgdir/usr/share/outfox/Docs/* $pkgdir/usr/share/doc/outfox
  rmdir $pkgdir/usr/share/outfox/Docs
  install -Dm755 $srcdir/outfox.sh $pkgdir/usr/bin/outfox
  install -Dm755 $srcdir/outfox.desktop $pkgdir/usr/share/applications/outfox.desktop
  install -Dm755 $srcdir/outfox.png $pkgdir/usr/share/pixmaps/outfox.png
}
md5sums=('f2856bdd58b0f858d4d12fa96f6e8e70'
         '3948603b54b512544490928f7acd07c9'
         '2b26841e2f3580e5bf2f63218834ec41')
