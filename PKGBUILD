# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-rssreader
pkgver=2.4.0
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Provides a simple OSD menu based user interface for reading user-defined RSS streams"
url="http://www.saunalahti.fi/rahrenbe/vdr/rssreader/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' 'expat' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.saunalahti.fi/~rahrenbe/vdr/$_plugname/files/$pkgname-$pkgver.tgz")
backup=('var/lib/vdr/plugins/rssreader/rssreader.conf'
        "etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('648280e4a86694746584d5debb7be246')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  make CXXFLAGS="$CXXFLAGS -std=gnu++98 -fPIC" GITTAG=''
}


package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
