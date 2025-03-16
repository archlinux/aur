# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-mpv
pkgver=1.8.1
pkgrel=2
_vdrapi=6
pkgdesc="mpv player plugin for VDR"
url="https://github.com/ua0lnj/vdr-plugin-mpv"
arch=('x86_64' 'i686')
license=('AGPL-3.0-only')
depends=('mpv' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/ua0lnj/vdr-plugin-mpv/archive/v$pkgver.tar.gz"
        "50-${pkgname//vdr-/}.conf")
backup=("etc/vdr/conf.avail/50-${pkgname//vdr-/}.conf")
sha256sums=('8072fedb2ed7840faa21e58344db3ac78c2fc8494ee9742ffb298d26b02c0eff'
            'e03891f550b215efa19cdb51e133434d99b416e91f0f6e7204ffaee70287633c')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"

  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
