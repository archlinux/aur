# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Yarema aka Knedlyk <yupadmin at gmail dot com>
pkgname=vdr-channelscan
pkgver=1.0.2
_vdrapi=2.4.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Channel scanner for VDR"
url="http://www.forum.free-x.de/wbb/index.php?page=Thread&threadID=1745"
license=("GPL2")
depends=('bzip2' "vdr-api=${_vdrapi}" 'zlib')
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://bitbucket.org/ua0lnj/channelscan.git#tag=$pkgver")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_plugname}"
  sed -i '/VDRDIR =/d' Makefile
}

build() {
  cd "${srcdir}/${_plugname}"
  make
}

package() {
  cd "${srcdir}/${_plugname}"
  make DESTDIR="${pkgdir}" install
 
  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
