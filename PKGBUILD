# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-imonlcd
pkgver=1.0.3
epoch=1
_vdrapi=2.6.3
pkgrel=4
pkgdesc="shows information about the current state of VDR on iMON LCD"
url="https://github.com/vdr-projects/vdr-plugin-imonlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('freetype2' 'gcc-libs' "vdr-api=$_vdrapi")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-imonlcd/archive/refs/tags/$pkgver.tar.gz"
        '92-imonlcd.rules'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('924dbf56a50101438ae5ef0ed5133dedcde282a80633a83b8c1bf884ca26221b'
            'c5ccf049a429a03225b5e018e0a90aaefac214b25540e13e9e864a17c66ef78d'
            'ca1ffbd37d13040cd9da0e16bf63cb809dc384972237096289639d43f1c109d5')

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make
}
package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/92-imonlcd.rules" "$pkgdir/usr/lib/udev/rules.d/92-imonlcd.rules"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
