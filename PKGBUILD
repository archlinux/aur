# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-noepg
pkgver=0.0.4
_gitver=b18cfff51a8d7722cc7f8ae511596714995f6c92
_vdrapi=2.2.0
pkgrel=2
pkgdesc="Replace the noepg-patch with the new cEpgHandler of vdr >= 1.7.26"
url="https://github.com/flensrocker/vdr-plugin-noepg"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://github.com/flensrocker/vdr-plugin-noepg.git#commit=$_gitver")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git describe --tags | sed 's/-/_/g;s/v//'
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail/"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
