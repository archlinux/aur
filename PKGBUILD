# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-cinebars
pkgver=0.1.0
_vdrapi=2.4.0
pkgrel=15
pkgdesc="Overlays cinema-bars over the live picture"
url="https://web.archive.org/web/20140911191316/http://egal-vdr.de/plugins/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://web.archive.org/web/20160306000428if_/http://egal-vdr.de/plugins/vdr-cinebars-0.1.0.tgz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('8e56e46cfdce941f0951c7573dd15a0a')

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
