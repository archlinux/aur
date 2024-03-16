# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-extrecmenung
pkgver=2.0.12
pkgrel=1
_vdrapi=2.6.6
pkgdesc="provides additional functions to VDR's recordings menu"
url="https://gitlab.com/kamel5/extrecmenung"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://gitlab.com/kamel5/extrecmenung/-/archive/v$pkgver/extrecmenung-v$pkgver.tar.bz2")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
replaces=("vdr-extrecmenu")
sha256sums=('30c921b2886e0c8e4d8180fab367082e0d6c2ad93bccf86fab23a2e4da63d0b4')

build() {
  cd "${srcdir}/${_plugname}-v$pkgver"
  make
}

package() {
  cd "${srcdir}/${_plugname}-v$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
