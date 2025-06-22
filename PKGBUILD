# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-favorites
pkgver=0.0.4
_vdrapi=8
pkgrel=7
pkgdesc="Implements a favorite channels menu"
url="https://github.com/vdr-projects/vdr-plugin-favorites"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-favorites/archive/$pkgver.tar.gz"
)
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('3d26d92f2d38fb6106dae3602b618508532bffd2efd2318116ada5e0a898fb3c')

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
