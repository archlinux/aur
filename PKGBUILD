# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-externalplayer
pkgver=0.4.0
_vdrapi=8
pkgrel=4
pkgdesc="use external players in VDR"
url="https://www.uli-eckhardt.de/vdr/external.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL-2.0-only')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
backup=('var/lib/vdr/plugins/externalplayer.conf')
_plugname=${pkgname//vdr-/}
source=("https://www.uli-eckhardt.de/vdr/download/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/$_plugname.conf")
sha256sums=('df6db3240ed5c626f24419a1a91b17bf7365ac24d438a835695f8134988c71f4'
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
