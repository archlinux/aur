# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-wirbelscan
pkgver=2021.11.28
_vdrapi=2.4.7
pkgrel=1
pkgdesc="Performs a channel scans for DVB-T, DVB-C and DVB-S"
url="https://www.gen2vdr.de/wirbel/wirbelscan/index2.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}" "librepfunc")
_plugname=${pkgname//vdr-/}
source=("https://www.gen2vdr.de/wirbel/wirbelscan/$pkgname-$pkgver.tgz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('f1005d1cccba77faacd294723240656fd7bad7987f0cf4a9728cc527fd7db76a')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
