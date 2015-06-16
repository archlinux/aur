# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvguideng
pkgver=0.1.3
_vdrapi=2.2.0
pkgrel=1
pkgdesc="highly customizable 2D EPG viewer plugin."
url="http://projects.vdr-developer.org/projects/plg-tvguideng"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=("vdr-api=$_vdrapi" 'vdr-skindesigner')
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/git/vdr-plugin-$_plugname.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('28d156c79a1a01786946c4dd9cb3e06c')

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
