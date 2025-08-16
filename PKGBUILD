# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrtva
pkgver=0.3.8
pkgrel=4
_vdrapi=9
pkgdesc="Automatic 'series record' function. Written for UK Freeview"
url='https://github.com/vdr-projects/vdr-plugin-vdrtva'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-${_plugname}/archive/refs/tags/${pkgver}.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('186f159487a754e84993c8b366367cee8cc2d706c701ea2caf2c0e63e83c370a'
            'c9d53920822753461d997a7190992c867af4f523d7c64ec2f528f7fce783840f')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  mkdir -p po
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
