# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-weatherforecast
pkgver=0.2.0
_vdrapi=2.6.3
pkgrel=9
pkgdesc="provides a weather forecast based on forecast.io data"
url='https://github.com/vdr-projects/vdr-plugin-weatherforecast'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'jansson' "vdr-api=$_vdrapi" 'vdr-skindesigner')
_plugname=${pkgname//vdr-/}
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-${_plugname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('f731b7175321ca1d6e28e7ef49095d8d')

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
