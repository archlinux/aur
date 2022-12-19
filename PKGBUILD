# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-channellists
pkgver=0.0.6
_vdrapi=2.6.3
pkgrel=5
pkgdesc="Plugin to manage your Channellists"
url="https://github.com/vdr-projects/vdr-plugin-channellists"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=("vdr-api=${_vdrapi}" "gcc-libs")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-channellists/archive/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('4efc5e1843279d4ae43bdb04b50443ce3202b1a908d7da49c8ab21c96d8e6e87'
            '09070fdddf10d79180bf59927e2b6280c456e9347652ae9b4271a0ef01d00bc2')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
