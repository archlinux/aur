# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-rssreader
pkgver=2.4.0
_vdrapi=2.6.3
pkgrel=9
pkgdesc="Provides a simple OSD menu based user interface for reading user-defined RSS streams"
url="https://github.com/rofafor/vdr-plugin-rssreader"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'expat' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/rofafor/vdr-plugin-rssreader/archive/v$pkgver.tar.gz")
backup=('var/lib/vdr/plugins/rssreader/rssreader.conf'
        "etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('b785400ef3e6916321fd239f29fcbbc36cd923cd8d2e79635a28776f82b192f6')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"

  make CXXFLAGS="$CXXFLAGS -std=gnu++98 -fPIC" GITTAG=''
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
