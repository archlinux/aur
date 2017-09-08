# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-dvbapi
pkgver=2.2.4
epoch=1
_vdrapi=2.2.0
pkgrel=2
pkgdesc="A bridge between VDR and OScam."
url="https://github.com/manio/vdr-plugin-dvbapi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'libdvbcsa' 'openssl' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("https://github.com/manio/vdr-plugin-dvbapi/archive/v$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('0014cd9fbf40d10f630c4aa9b2e60c9dca44d4cdab27529da3e47be9a9c01e13')

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
