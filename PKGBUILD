# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-vdrboblight
pkgver=0.0.8
_vdrapi=9
pkgrel=7
pkgdesc="Boblight with data from softhddevice"
url="https://github.com/vdr-projects/vdr-plugin-boblight"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('boblight' 'gcc-libs' "vdr-api=${_vdrapi}")
replaces=('vdr-boblight')
conflicts=('vdr-boblight')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-boblight/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('ff3469fb8cd5332ac281197110ee7749543051d79c26966c79836b08ff8901d1')

build() {
  cd "${srcdir}/vdr-plugin-boblight-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-boblight-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
