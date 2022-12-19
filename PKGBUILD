# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinsoppalusikka
pkgver=2.4.0
_vdrapi=2.6.3
pkgrel=9
pkgdesc='Standalone skin providing the good old "ElchiAIO" looks'
url="https://github.com/rofafor/vdr-plugin-skinsoppalusikka"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/rofafor/vdr-plugin-skinsoppalusikka/archive/v2.4.0.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('7edf1d9288b2be48b3968e6d11008478334f56657cea9882c852f3c34db6fc00'
            '47aa997228e61df5b858f861b1e941efade54a79186ff771600772c5b50a41f1')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make GITTAG=''
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  chown -R 666:666 "$pkgdir/var/lib/vdr"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
