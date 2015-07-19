# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-mpv
pkgver=0.0.4
_vdrapi=2.2.0
pkgrel=1
pkgdesc="mpv player plugin for VDR"
url="http://www.vdr-portal.de/board1-news/board2-vdr-news/126741-announce-mpv-plugin-0-0-2/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('AGPL3')
depends=('mpv' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/git/vdr-plugin-mpv.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2"
        "50-${pkgname//vdr-/}.conf")
backup=("etc/vdr/conf.avail/50-${pkgname//vdr-/}.conf")
md5sums=('75e740d1559bc5e06845971d880e8371'
         'd1f90a5bc8d735b48764e12384324750')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"

  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
