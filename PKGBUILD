# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-devstatus
pkgver=0.5.0
_vdrapi=2.6.3
pkgrel=6
pkgdesc="displays the status of all available dvb devices"
url="https://gitlab.com/kamel5/devstatus"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://gitlab.com/kamel5/devstatus/-/archive/v$pkgver/devstatus-v$pkgver.tar.bz2")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('658ae5cb3dd708b6b43e3491b9845f3a07cf1689f8df1a1cd93c869a515f62c1')

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
