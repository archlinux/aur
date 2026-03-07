# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinflatplus
pkgver=1.2.8
pkgrel=1
_vdrapi=11
pkgdesc="Simple and slim skin for VDR"
url="https://github.com/MegaV0lt/vdr-plugin-skinflatplus"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
depends=('fontconfig' 'graphicsmagick' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/MegaV0lt/vdr-plugin-skinflatplus/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=('etc/epgd/eventsview-flatplus.sql'
        "etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/skinflatplus/configs/'{MV_default,default,fnu_default})
sha256sums=('5d6f729d72eda853faf435375d9a35a2797bc78c7d5ab8f35f523ae5b0b2ef53'
            '6f6f9699cbc73d73d34c4e17183d3f03b1553a2b8caa62ee881354f2ac12bd8d')

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make IMAGELIB=graphicsmagick
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 contrib/eventsview-flatplus.sql "$pkgdir/etc/epgd/eventsview-flatplus.sql"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
  rm "$pkgdir/var/lib/vdr/plugins/skinflatplus/configs/skin flat"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
