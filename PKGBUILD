# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Alexander Grothe <seahawk1986[at]hotmail[dot]com>
pkgname=vdr-zappilot
pkgver=0.0.6
_vdrapi=2.6.3
pkgrel=4
pkgdesc="Plugin for VDR forked from the plugin pilotskin to browse EPG in channel info"
url="https://github.com/vdr-projects/vdr-plugin-zappilot"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-zappilot/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('a4551a80582c432ecddf73b50c0e028e53abab4c8b863698397d8ff96f886e78')

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
