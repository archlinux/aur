# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname='vdr-osd2web'
pkgver=0.2.37
_vdrapi=2.4.0
pkgrel=1
pkgdesc='osd2web is a VDR skin interface for web browsers, to show and navigate through the VDR osd'
url="https://github.com/horchi/vdr-plugin-osd2web"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('jansson' 'libwebsockets' 'tinyxml2' 'libexif' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://github.com/horchi/vdr-plugin-osd2web/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
options=('!emptydirs')
md5sums=('bdbc5083b699fe4fce4a015a50a71215'
         'e4c8311b59cf3a28327bcae842dc4699')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
#  export DEFINES="-D__STL_CONFIG_H"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
