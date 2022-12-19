# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: George Kranis https://github.com/gkranis/vdr4arch
pkgname=vdr-eepg
pkgver=0.0.6
_vdrapi=2.6.3
pkgrel=5
pkgdesc="Extended EPG (EEPG) plugin for VDR"
url="https://github.com/vdr-projects/vdr-plugin-eepg"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-eepg/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('c603c2c5683c002ad0f0e79c0e91247283b49dfc73211a4923df2ff209a0e771')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
