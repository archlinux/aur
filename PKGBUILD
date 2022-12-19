# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-graphlcd
pkgver=1.0.6
_vdrapi=2.6.3
pkgrel=5
epoch=1
pkgdesc="VDR Plugin to support graphical LC displays"
url="https://github.com/vdr-projects/vdr-plugin-graphlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphlcd-base>=2.0.0' 'ttf-dejavu' 'ttf-bitstream-vera' "vdr-api=${_vdrapi}")
optdepends=('serdisplib: Support more modern LCDs')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-graphlcd/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('00fae84eed95dd06033affc4df82e121205f89b9b86f6e1c8b64f4ae423f900e'
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
