# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-tvguide
pkgver=1.2.17
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
source=("https://projects.vdr-developer.org/git/vdr-plugin-tvguide.git/snapshot/vdr-plugin-tvguide-$pkgver.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('873ab7cc5abd0d48b3882608a5d2a2b197d13af553526740515f1fa78478aab8'
            '6e556c9cce43a02eeb881950e4e7c8ea0c270af00f609bf9bf950294203a3391')

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make IMAGELIB=graphicsmagick
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
