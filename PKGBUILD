# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-favorites
pkgver=0.0.3
_vdrapi=2.6.3
pkgrel=5
pkgdesc="Implements a favorite channels menu"
url="https://github.com/vdr-projects/vdr-plugin-favorites"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-favorites/archive/$pkgver.tar.gz"
)
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('3aef2917336717e6e1cdfecc3a586a713e29dc7d292a4cbcf3b59045b3cf646e')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
