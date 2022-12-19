# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-externalplayer
pkgver=0.3.5
_vdrapi=2.6.3
pkgrel=6
pkgdesc="use external players in VDR"
url="https://www.uli-eckhardt.de/vdr/external.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
backup=('var/lib/vdr/plugins/externalplayer.conf')
_plugname=${pkgname//vdr-/}
source=("https://www.uli-eckhardt.de/vdr/download/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/$_plugname.conf")
sha256sums=('8307db0106bdea39ae21157bc496a832fbf7998d94c592aacb8bb69143f81df9'
            '743dcfe9caa98289634c6020b8b9de4011e2d8946630b37b68edea5428058359')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
