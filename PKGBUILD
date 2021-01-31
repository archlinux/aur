# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-externalplayer
pkgver=0.3.4
_vdrapi=2.4.6
pkgrel=1
pkgdesc="use external players in VDR"
url="http://www.uli-eckhardt.de/vdr/external.en.shtml"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
backup=('var/lib/vdr/plugins/externalplayer.conf')
_plugname=${pkgname//vdr-/}
source=("https://www.uli-eckhardt.de/vdr/download/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname.conf")
sha256sums=('6b9ad94a9a659854a93016ef1694fb43fec57103c93ae6f4247a2ce91382ffc6'
            '743dcfe9caa98289634c6020b8b9de4011e2d8946630b37b68edea5428058359')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" \
       CFGDIR="/var/lib/vdr/plugins/" \
       install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
