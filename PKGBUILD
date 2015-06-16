# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-rpihddevice
pkgver=0.1.0
_gitver=0405214fbb93580ddad245b3a046bf51d410cb72
_vdrapi=2.2.0
pkgrel=1
pkgdesc="Output device for Raspberry Pi"
url="http://projects.vdr-developer.org/projects/plg-rpihddevice"
arch=('armv6h' 'armv7h')
license=('GPL2')
depends=('ffmpeg' 'mesa' 'raspberrypi-firmware-tools' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-rpihddevice.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '60564c9e26e39aedf8a932d8093f999a')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
