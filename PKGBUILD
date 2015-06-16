# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-mpv
pkgver=0.0.2
_vdrapi=2.2.0
pkgrel=1
pkgdesc="mpv player plugin for VDR"
url="http://www.vdr-portal.de/board1-news/board2-vdr-news/126741-announce-mpv-plugin-0-0-2/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('AGPL3')
depends=('mpv' "vdr-api=${_vdrapi}")
source=("$pkgname-$pkgver.tar.bz2::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=38361"
        "50-${pkgname//vdr-/}.conf")
backup=("etc/vdr/conf.avail/50-${pkgname//vdr-/}.conf")
md5sums=('5026ce63061e7390fa51b13c8df98e0f'
         'd1f90a5bc8d735b48764e12384324750')

build() {
  cd "${srcdir}/${pkgname//vdr-/}-$pkgver"

  make
}

package() {
  cd "${srcdir}/${pkgname//vdr-/}-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-${pkgname//vdr-/}.conf" "$pkgdir/etc/vdr/conf.avail/50-${pkgname//vdr-/}.conf"
}
