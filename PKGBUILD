# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-bgprocess
pkgver=0.1.1
_vdrapi=2.6.3
pkgrel=5
pkgdesc="Displays information about background processes"
url="https://github.com/vdr-projects/vdr-plugin-bgprocess"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-bgprocess/archive/0.1.1.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('9fb77f79e6f1f1b831dbc672ac459b6664bcd7c72597d0d91ac02bdf8ef5a4d7')

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr/include/vdr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
       VDRLOCALE=1 \
       all

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
