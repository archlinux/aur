# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-dvbapi
pkgver=2.2.1
epoch=1
_vdrapi=2.2.0
pkgrel=1
pkgdesc="A bridge between VDR and OScam."
url="https://github.com/manio/vdr-plugin-dvbapi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'libdvbcsa' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("https://github.com/manio/vdr-plugin-dvbapi/archive/v$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('1586fcbc043e6bb74bf9715f4821570558d907e5bfd768ce12b532972998beda')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  sed -i 's/ -fdiagnostics-color=auto//g' Makefile
  make LIBDVBCSA=1
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make LIBDVBCSA=1 DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
