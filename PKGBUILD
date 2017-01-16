# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-duplicates
pkgver=0.1.0
_vdrapi=2.2.0
pkgrel=2
pkgdesc="Shows duplicate recordings"
url="http://tolleri.net/vdr/plugins/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://tolleri.net/vdr/plugins/$pkgname-$pkgver.tgz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('a7bf122811c080f0a928dc7b9f9cd842')

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
