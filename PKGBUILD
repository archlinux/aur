# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-epgsync
pkgver=1.0.1
_vdrapi=2.4.0
pkgrel=9
pkgdesc="Import the EPG of a remote VDR"
url="http://vdr.schmirler.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://vdr.schmirler.de/$_plugname/$pkgname-$pkgver.tgz"
        "vdr-2.3.2-epgsync-1.0.1_v2.diff::https://www.vdr-portal.de/index.php?attachment/40535")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('694024ecd7bb813d43620ded63fc3ab4'
         '779d3c997ea2bdf667752affff102f75')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/vdr-2.3.2-epgsync-1.0.1_v2.diff"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
