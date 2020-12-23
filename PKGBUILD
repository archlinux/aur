# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-extrecmenung
pkgver=2.0.5
_vdrapi=2.4.6
pkgrel=3
pkgdesc="provides additional functions to VDR's recordings menu"
url="https://gitlab.com/kamel5/extrecmenung"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://gitlab.com/kamel5/extrecmenung/-/archive/v$pkgver/extrecmenung-v$pkgver.tar.bz2")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
replaces=("vdr-extrecmenu")
sha256sums=('0b487afa5bf3f4acd2d9f1d1478dae021cecf4d1ef60fe7bf199c49b88ee4232')

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
