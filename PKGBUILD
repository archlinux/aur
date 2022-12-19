# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvguideng
pkgver=0.3.2
_vdrapi=2.6.3
pkgrel=5
pkgdesc="highly customizable 2D EPG viewer plugin."
url="https://gitlab.com/kamel5/tvguideng"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=("vdr-api=$_vdrapi" 'vdr-skindesigner')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/kamel5/tvguideng/-/archive/$pkgver/tvguideng-$pkgver.tar.bz2")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('3ae296cbeb0328bf11c8f3fa230bf5e786523e2ce6a2f166d2693d50827a13cc')

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
