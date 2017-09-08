# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-osdteletext
pkgver=0.9.5
_vdrapi=2.2.0
pkgrel=4
pkgdesc="Displays teletext pages directly on VDR's OSD"
url="http://projects.vdr-developer.org/projects/plg-osdteletext"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/git/vdr-plugin-$_plugname.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2"
        "0001-Use-internal-cBitmap-for-drawing-instead-of-getting-.diff::https://www.vdr-portal.de/index.php?attachment/39352"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('5e578b222ab55c3e7fffd06a1b0a306d'
         '870f1f7834b906a5ee1e7f1c2289e27e'
         '4e47fd8f77cea06d30e07486b7fd9d6e')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/0001-Use-internal-cBitmap-for-drawing-instead-of-getting-.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
