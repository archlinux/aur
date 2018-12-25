# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-neutrinoepg
pkgver=0.3.6
_vdrapi=2.4.0
pkgrel=16
pkgdesc="Neat EPG-Viewer for VDR"
url="http://projects.vdr-developer.org/projects/plg-neutrinoepg"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=$_vdrapi")
makedepends=('patchutils')
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1475/$_plugname-$pkgver.tar.gz"
        "vdr-2.4-neutrinoepg.diff::https://projects.vdr-developer.org/git/vdr-plugin-neutrinoepg.git/patch/?id=f7488c0eac22cd9fdec402c519de775ab330acaf&id2=4fec4bcb560d4bd1e81585a0a4dfc7c4f31f6863")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('881426478efc94111c3f11c6b68f25c4'
         'c608dbdb7805330e06c0cdfe7283e854')

prepare() {
  cd "$srcdir/$_plugname-$pkgver"
  filterdiff -x '*/HISTORY' "$srcdir/vdr-2.4-neutrinoepg.diff" | patch -p1
}

build() {
  cd "$srcdir/$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
