# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-favorites
pkgver=0.0.2
_vdrapi=2.2.0
pkgrel=12
pkgdesc="Implements a favorite channels menu"
url="http://www.vdr-portal.de/board1-news/board2-vdr-news/p1039565-announce-vdr-favorites-0-0-2/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tgz::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=29502"
        "favorites-makefile-1.7.36.tar.gz::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=32856")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('b5e87d11102ff1d8923a64cd53694171'
         'e3262d62bee7d4e99c16d3359e77261f')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  cp "$srcdir/favorites-makefile-1.7.36" Makefile
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
