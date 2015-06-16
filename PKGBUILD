# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-recsearch
pkgver=0.3.5
_vdrapi=2.2.0
pkgrel=6
pkgdesc="Search your recordings and find the one you are looking for"
url="https://github.com/flensrocker/vdr-plugin-recsearch"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://github.com/flensrocker/vdr-plugin-$_plugname/archive/v$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('afd1e3d95ac0e4e1e416b8a86ae32f9a')

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
