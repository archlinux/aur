# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-svdrposd
pkgver=1.0.0
_vdrapi=8
pkgrel=29
pkgdesc="Make contents of OSD menu available via SVDRP"
url="https://github.com/vdr-projects/vdr-plugin-svdrposd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-svdrposd/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('c5233a61d6295eb06e5ff0b9a886420e8ceabf270d78f2c7814ed8f58c38acd7')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
