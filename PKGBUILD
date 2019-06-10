# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-tvguide
pkgver=1.2.7
epoch=1
_vdrapi=2.4.0
pkgrel=1
pkgdesc="highly customizable 2D EPG viewer plugin."
url="https://gitlab.com/kamel5/tvguide"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' 'libpng' "vdr-api=$_vdrapi")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("https://gitlab.com/kamel5/$_plugname/-/archive/v$pkgver/$_plugname-v$pkgver.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('38196a1a0b2479e5f2f9dcbaa97bdd84'
         '3caf2313b8794eaa525af664a7208b7a')

build() {
  cd "$srcdir/$_plugname-v$pkgver"
  make IMAGELIB=graphicsmagick
}

package() {
  cd "$srcdir/$_plugname-v$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
