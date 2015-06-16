# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinsoppalusikka
pkgver=2.2.1
_vdrapi=2.2.0
pkgrel=1
pkgdesc='Standalone skin providing the good old "ElchiAIO" looks'
url="http://www.saunalahti.fi/~rahrenbe/vdr/soppalusikka/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.saunalahti.fi/~rahrenbe/vdr/soppalusikka/files/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('a5fa88ec9a3b56bdeefbec6449e37ce5'
         'bd9d1d8599cb554fe4a59ceeb08662d8')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make GITTAG=''
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  chown -R 666:666 "$pkgdir/var/lib/vdr"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
