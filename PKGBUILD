# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-duplicates
pkgver=1.0.1
_vdrapi=5
pkgrel=12
pkgdesc="Shows duplicate recordings"
url='https://github.com/vdr-projects/vdr-plugin-duplicates'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-duplicates/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('c1065d7acd582a596711eb86c44865a8b79808f7ee74101a80255a924856c038')

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
