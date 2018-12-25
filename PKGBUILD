# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-peer
pkgver=0.0.1
_vdrapi=2.4.0
pkgrel=16
pkgdesc="Wrapper for the plugins remotetimers and remoteosd"
url="http://vdr.schmirler.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
optdepends=('remoteosd: Add/edit/remove timers on local and peer VDR or move timers between them'
            'remotetimers: Access menu of peer')
_plugname=${pkgname//vdr-/}
source=("http://vdr.schmirler.de/$_plugname/$pkgname-$pkgver.tgz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('6a50045f82d3a5784cb26d7e6cf4fb39')

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
