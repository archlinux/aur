# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname='vdr-osd2web'
pkgver=0.2.56
_vdrapi=2.6.3
pkgrel=1
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
sha256sums=('38e8e8a20e5b59c76a1f18aa3dc6b7ad4372241414f71c292fed8986c0785f02'
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
