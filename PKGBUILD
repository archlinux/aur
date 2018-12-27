# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-epgborder
pkgver=1.0.0
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Blocks EPG storage starting from a set border channel number"
url="https://github.com/M-Reimer/vdr-plugin-epgborder"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=("vdr-api=${_vdrapi}" gcc-libs)
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("https://github.com/M-Reimer/vdr-plugin-epgborder/archive/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('253900586f5e8e65423718e5af40f118')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail/"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
