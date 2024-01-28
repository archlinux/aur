# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-epg2vdr
pkgver=1.2.16
pkgrel=2
_vdrapi=2.6.6
pkgdesc="Used to retrieve EPG data into the VDR"
url="https://github.com/horchi/vdr-plugin-epg2vdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-2.0-or-later')
depends=('jansson' 'libmariadbclient' 'libutil-linux' 'python' 'tinyxml2' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/horchi/vdr-plugin-epg2vdr/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/epg2vdr/epg.dat')
sha256sums=('a4e12437ceb859bb6cbf98416aadba4b831ea636cd903631a2f4bdf612af17f0')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make GIT_REV=''
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
