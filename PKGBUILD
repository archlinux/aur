# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-cinebars
pkgver=0.1.0
_vdrapi=2.6.3
pkgrel=22
pkgdesc="Overlays cinema-bars over the live picture"
url="https://github.com/vdr-projects/vdr-plugin-cinebars"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-cinebars/archive/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('6bcc38da4be6da7e9cb9cf4861ed177b03dea61cebb0234b28e2121e69eee94c')

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
