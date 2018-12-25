# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-cdplayer
pkgver=1.2.4
_vdrapi=2.4.0
pkgrel=2
pkgdesc="CD-Player plugin which supports CD-Text and CDDB-Database"
url="http://uli-eckhardt.de/vdr/cdplayer.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libcdio-paranoia' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
backup=("var/lib/vdr/plugins/$_plugname/cd.mpg")
source=("https://www.uli-eckhardt.de/vdr/download/${pkgname}-${pkgver}.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('47b97a8e076bd5f808ee23179f982f18'
         '44d03e8a2436daab8d9f31f444d494af')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make CFGDIR=$(pkg-config --variable=resdir vdr)/plugins/$_plugname DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
