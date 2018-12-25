# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-recsearch
pkgver=0.3.7
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Search your recordings and find the one you are looking for"
url="https://github.com/flensrocker/vdr-plugin-recsearch"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://github.com/flensrocker/vdr-plugin-$_plugname/archive/v$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('9d5e0e6ce7461ffd27895d41bc044586')

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
