# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=outfox_bin
#      main  date     sub  codename
pkgver=5.3.0_20250907_5.0_043
read main date sub codename <<< $(echo "${pkgver}" | sed 's/_/ /g')
pkgrel=2
pkgdesc="fork of open source rhythm game engine StepMania"
arch=('x86_64')
options=('!strip')
url="https://projectoutfox.com/"
license=('Apache')
depends=('libusb-compat' 'ffmpeg' 'lua')
makedepends=(gendesk)
source=("https://github.com/TeamRizu/OutFox/releases/download/OF${sub}.0-${codename}/OutFox-alpha-0.${sub}-pre-${codename}-Final-arch-btw-amd64-arch-date-${date}.tar.gz"
        "outfox.sh"
        "outfox.png")

prepare() {
  cd $srcdir
  gendesk -f -n --pkgname outfox --pkgdesc "${pkgdesc}" --exec "outfox" --categories "Game;AudioVideo;ArcadeGame"
}


package() {
  install -dm755 $pkgdir/usr/share/outfox $pkgdir/usr/share/doc/outfox
  cd $srcdir/OutFox-alpha-0.${sub}-pre${codename}-Final-arch-btw-amd64-arch-date-${date}
  cp -R . $pkgdir/usr/share/outfox
  mv $pkgdir/usr/share/outfox/Docs/* $pkgdir/usr/share/doc/outfox
  rmdir $pkgdir/usr/share/outfox/Docs
  install -Dm755 $srcdir/outfox.sh $pkgdir/usr/bin/outfox
  install -Dm755 $srcdir/outfox.desktop $pkgdir/usr/share/applications/outfox.desktop
  install -Dm755 $srcdir/outfox.png $pkgdir/usr/share/pixmaps/outfox.png
}
md5sums=('61c32e56aa3d8e61eb0670df80d3840a'
         '3948603b54b512544490928f7acd07c9'
         '4c2fb0decfe69847f52dfef9ada6a921')
