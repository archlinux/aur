# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-pulsecontrol
pkgver=0.2.1
pkgrel=1
_vdrapi=2.4.0
pkgdesc="For controlling some pulseaudio properties"
url="https://github.com/flensrocker/vdr-plugin-pulsecontrol"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libpulse' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://github.com/flensrocker/vdr-plugin-$_plugname/releases/download/$pkgver/vdr-plugin-${_plugname}_$pkgver.orig.tar.gz")
md5sums=('d33cb62d07f64255df9f9f00f94be7b3')

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
