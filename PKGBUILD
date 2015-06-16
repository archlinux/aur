# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvguide
pkgver=1.2.2
epoch=1
_vdrapi=2.2.0
pkgrel=8
pkgdesc="highly customizable 2D EPG viewer plugin."
url="http://projects.vdr-developer.org/projects/plg-tvguide"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' 'libpng' "vdr-api=$_vdrapi")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1701/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('1e811e1a99f68afd8f85f56fd416a0f1'
         '3caf2313b8794eaa525af664a7208b7a')

build() {
  cd "$srcdir/$_plugname-$pkgver"
  make IMAGELIB=graphicsmagick
}

package() {
  cd "$srcdir/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
