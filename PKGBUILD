# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-duplicates
pkgver=1.0.1
_gitver=68739fd72beb9745b3e47b9e466311ef23a8ca97
_vdrapi=2.6.1
pkgrel=7
pkgdesc="Shows duplicate recordings"
url="https://projects.vdr-developer.org/git/vdr-plugin-duplicates.git"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.bz2::https://projects.vdr-developer.org/git/vdr-plugin-duplicates.git/snapshot/vdr-plugin-duplicates-$_gitver.tar.bz2")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('29d7c05ecb17a21252d006baf45c8b223a1564ccfe54cebc79790adbd387f0d9')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${_gitver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${_gitver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
