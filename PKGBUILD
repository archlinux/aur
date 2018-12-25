# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: George Kranis https://github.com/gkranis/vdr4arch
pkgname=vdr-eepg
pkgver=0.0.5_233_g7f7ec60
_gitver=7f7ec60c3654f318fc4ec918a29b8b95c8c4a25e
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Extended EPG (EEPG) plugin for VDR"
url="http://projects.vdr-developer.org/projects/plg-eepg"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-eepg.git#commit=$_gitver")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/eepg_//g'
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
