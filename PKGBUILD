# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-duplicates
pkgver=1.0.1
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Shows duplicate recordings"
url="https://projects.vdr-developer.org/projects/plg-duplicates"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/attachments/download/2170/vdr-duplicates-${pkgver}.tgz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('3c843fe76649743ab106b60508058d25')

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
