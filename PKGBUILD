# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-channellists
pkgver=0.0.5
_vdrapi=2.4.0
pkgrel=8
pkgdesc="Plugin to manage your Channellists"
url="http://www.zulu-entertainment.de/content.php?f=VDR-Plugins&sub=Channellists"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libcdio-paranoia' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
backup=("var/lib/vdr/plugins/$_plugname/cd.mpg")
source=("http://www.zulu-entertainment.de/files/$pkgname/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('20ab294c48164b513ed0557acee5c66c'
         '6a30260380a577d8514d37d8f318f8fd')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make CFGDIR=$(pkg-config --variable=resdir vdr)/plugins/$_plugname DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
