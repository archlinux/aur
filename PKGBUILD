# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-wirbelscan
pkgver=2023.10.15
pkgrel=4
_vdrapi=2.6.7
pkgdesc="Performs a channel scans for DVB-T, DVB-C and DVB-S"
url="https://www.gen2vdr.de/wirbel/wirbelscan/index2.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}" "librepfunc")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/wirbel-at-vdr-portal/wirbelscan-dev/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('5079bc93cd09edab2dc2f077d70af42c13306c688d52365b1e7c0e1781771596')

build() {
  cd "${srcdir}/${_plugname}-dev-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-dev-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
