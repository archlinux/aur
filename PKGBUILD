# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinflat
pkgver=0.1.1
_vdrapi=2.4.0
pkgrel=23
pkgdesc="Simple and slim skin for VDR"
url="http://projects.vdr-developer.org/projects/plg-skinflat"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1476/$_plugname-$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('1c54a17cdb9f56608dce815bc87e72da'
         'e6ba017eb9caf71f6ce4dc622a1a2bc8')

prepare() {
  cd "${srcdir}/$_plugname-$pkgver"
  sed -i 's/Magick++/GraphicsMagick++/g' Makefile
}

build() {
  cd "${srcdir}/$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
