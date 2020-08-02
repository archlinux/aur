# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-wirbelscan
pkgver=2020.05.10
_vdrapi=2.4.3
pkgrel=1
pkgdesc="Performs a channel scans for DVB-T, DVB-C and DVB-S"
url="http://wirbel.htpc-forum.de/wirbelscan/index2.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://www.gen2vdr.de/wirbel/wirbelscan/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('77962d9d6a7cb0bda1638648ba046c5fdcfbc16b01f0765f5b7e4d2f18cd0ff4'
            '802a1cbd4044c7f0e811b04265c6cc85890c811bd76c43687bcbc15a07d4419b')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
