# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-satip
pkgver=2.5.1
pkgrel=3
_vdrapi=13
pkgdesc="Integrates SAT>IP network devices seamlessly into VDR"
url="https://github.com/FireFlyVDR/vdr-plugin-satip"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL2')
depends=('curl' 'pugixml' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/FireFlyVDR/vdr-plugin-satip/archive/refs/tags/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
sha256sums=('c2cf9fba87ea5a04ab247c64bf352b86edd3a53f43d799eb08e7a7898f4d8d1b'
            'fce92c838c53ac84cb750942d2b016d2de2032f03b837ad68f773c36373305e1')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make GITTAG=''
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
