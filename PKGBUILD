# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-ddci2
pkgver=1.0.5
_vdrapi=2.6.3
pkgrel=6
pkgdesc="Support for stand alone CI by Digital Devices for VDR 2.1.6 and higher."
url="https://github.com/jasmin-j/vdr-plugin-ddci2"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasmin-j/vdr-plugin-ddci2/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('6ec748ee235ec70cb41e0529832c53cfbfa5b53b83f71285e87d2d61edcd14bb'
            '8537997f76d6ccb3ee45ac288134a32e596d422082a4bff70ccd6cc3eb7e64f5')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
