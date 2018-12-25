# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-radio
pkgver=1.1.0
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Display an background image while the vdr is switched to radio channels"
url="https://projects.vdr-developer.org/projects/vdr-plugin-radio"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/git/vdr-plugin-radio.git/snapshot/vdr-plugin-radio-${pkgver}.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('22de146f844038fb151edf3e2638be48'
         'bbb81b2f18c2ee2d54b501e778c00b01')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  #Install all stillpictures
  mkdir -p "$pkgdir/usr/share/vdr/plugins/$_plugname"
  install -Dm644 config/mpegstill/* "$pkgdir/usr/share/vdr/plugins/$_plugname"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
