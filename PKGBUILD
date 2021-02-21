# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-osdteletext
pkgver=0.9.9
_vdrapi=2.4.6
pkgrel=1
pkgdesc="Displays teletext pages directly on VDR's OSD"
url="https://github.com/vdr-projects/vdr-plugin-osdteletext"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
optdepends=('ttf-teletext2: rendering special graphic characters used in Teletext')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-osdteletext/archive/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('9839ace7a44b141c6f09295259c5f8a51a6ac5db8c60840000aca3bf407cf1f8'
            '8e1347177732fc334ab1f542f3e434728889c9006e211e9a7ff53c6cbc1ecb2e')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
