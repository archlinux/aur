# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvguideng
pkgver=0.3.4
pkgrel=3
_vdrapi=2.6.6
pkgdesc="highly customizable 2D EPG viewer plugin."
url="https://gitlab.com/kamel5/tvguideng"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=("vdr-api=$_vdrapi" 'vdr-skindesigner')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/kamel5/tvguideng/-/archive/$pkgver/tvguideng-$pkgver.tar.bz2")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('5e06c43dd293bffdc79498eba94d3eff73cc4eb9ac2842ca322a5d53794ed63e')

build() {
  cd "$srcdir/$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
