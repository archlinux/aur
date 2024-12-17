# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname='vdr-osd2web'
pkgver=0.3.2
_vdrapi=5
pkgrel=5
pkgdesc='osd2web is a VDR skin interface for web browsers, to show and navigate through the VDR osd'
url="https://github.com/horchi/vdr-plugin-osd2web"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('jansson' 'libwebsockets' 'tinyxml2' 'libexif' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/horchi/vdr-plugin-osd2web/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
sha256sums=('c540ff5c24618f76a0d92bd08bdeeb3a8d1bda4f57728c6ef2e4d3cbf373ded5'
            '330126667df54bcb853346bf2dde52beecafc4fda1a684b68d4cc81908ba551c')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
#  export DEFINES="-D__STL_CONFIG_H"
  make PREFIX='/usr'
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
