# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-tvguide
pkgver=1.2.16
epoch=1
_vdrapi=2.4.1
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
sha256sums=('f50d0f6fd6f27afcd8da30d422909d1cc70cfa33be2e733d333b60e0956960da'
            '6e556c9cce43a02eeb881950e4e7c8ea0c270af00f609bf9bf950294203a3391')

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
