# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-satip
pkgver=2.5.0
pkgrel=1
_vdrapi=9
pkgdesc="Integrates SAT>IP network devices seamlessly into VDR"
url="https://github.com/FireFlyVDR/vdr-plugin-satip"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'pugixml' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/FireFlyVDR/vdr-plugin-satip/archive/refs/tags/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
sha256sums=('7a62a5f19ed2135b01a128a6d742f8e8620ce0b1c1f9fa4226dd91c8be23e44a'
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
