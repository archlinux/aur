# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vdrtva
pkgver=0.3.7
_vdrapi=2.6.3
pkgrel=4
pkgdesc="Automatic 'series record' function. Written for UK Freeview"
url='https://github.com/vdr-projects/vdr-plugin-vdrtva'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-${_plugname}/archive/refs/tags/v${pkgver}.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('a9bed819c424256ad587e3c9d0f580b7cffdcdd9c0c020f2bfc92c09f002cb84'
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
