# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-duplicates
pkgver=1.0.1
_gitver=68739fd72beb9745b3e47b9e466311ef23a8ca97
_vdrapi=2.6.3
pkgrel=8
pkgdesc="Shows duplicate recordings"
url='https://github.com/vdr-projects/vdr-plugin-duplicates'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-${_plugname}/archive/${_gitver}.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('8966dc077b5a35e82764e537fde034abc429ff63c7abbce4e2ba42c4e76fc72d')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${_gitver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${_gitver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
