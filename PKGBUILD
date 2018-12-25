# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-weatherforecast
pkgver=0.2.0
_vdrapi=2.4.0
pkgrel=2
pkgdesc="provides a weather forecast based on forecast.io data"
url="http://projects.vdr-developer.org/projects/plg-weatherforecast"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'jansson' "vdr-api=$_vdrapi" 'vdr-skindesigner')
_plugname=${pkgname//vdr-/}
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
source=("http://projects.vdr-developer.org/git/vdr-plugin-$_plugname.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2")
md5sums=('e28456a1b475fc2ba31b2ecc373634d6')

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
