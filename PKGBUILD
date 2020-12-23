# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-graphlcd
pkgver=1.0.2
_vdrapi=2.4.6
pkgrel=2
epoch=1
pkgdesc="VDR Plugin to support graphical LC displays"
url="http://projects.vdr-developer.org/projects/show/graphlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphlcd-base>=2.0.0' 'ttf-dejavu' 'ttf-bitstream-vera' "vdr-api=${_vdrapi}")
optdepends=('serdisplib: Support more modern LCDs')
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/git/vdr-plugin-graphlcd.git/snapshot/vdr-plugin-graphlcd-$pkgver.tar.bz2"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('cb5798872c30a9894913bf8ff917586f8609826c7e01e434ccb6ac2d913859e8'
            'abd081e90be318afa2c4168dfb595afef7483e2b1083874ab607e5ba60417d1c')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-$pkgver"
  make DESTDIR="${pkgdir}" install

  # Make use of the graphlcd >= 2.0.0 system font directory search
  rm "$pkgdir/usr/share/vdr/plugins/graphlcd/fonts/"*.ttf

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
