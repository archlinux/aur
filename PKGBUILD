# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-zaphistory
pkgver=0.9.6
_vdrapi=2.2.0
pkgrel=13
pkgdesc="History of the latest viewed channels"
url="http://projects.vdr-developer.org/projects/plg-zaphistory"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1437/$_plugname-$pkgver.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('70298659539f63c043694b565396e513')

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
