# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-extrecmenu
pkgver=1.2.4_2_g77d10fa
epoch=1
_gitver=77d10faec3c7b0abe25ba3b161dc3b4e2cad042b
_vdrapi=2.4.0
pkgrel=2
pkgdesc="provides additional functions to VDR's recordings menu"
url="http://projects.vdr-developer.org/projects/show/plg-extrecmenu"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-extrecmenu.git#commit=$_gitver"
        "epgsearch-newmakefile-vdr-1.7.36.tgz::https://www.vdr-portal.de/index.php?attachment/32667")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'da93e7d1b5b6b59bcbee8730c9b9e97a')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  cp "$srcdir/$_plugname/Makefile" .
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
