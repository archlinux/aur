# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-zaphistory
pkgver=0.9.7
_vdrapi=2.6.3
pkgrel=2
pkgdesc="History of the latest viewed channels"
url='https://vdr-projects.e-tobi.net/projects/plg-zaphistory'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-zaphistory/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('1cb1e2e7213e228a9bb8bb8a10f015a055fdccb47d67bc619897379d4126820e')

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
