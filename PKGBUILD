# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-epg2vdr
pkgver=0.1.12
_gitver=57766287256873ab843f1366258e139b5ccf9dbb
_vdrapi=2.2.0
pkgrel=4
pkgdesc="Used to retrieve EPG data into the VDR"
url="http://projects.vdr-developer.org/projects/plg-epg2vdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libmariadbclient' 'libutil-linux' "vdr-api=${_vdrapi}")
makedepends=('git' 'imlib2' 'libxslt')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-epg2vdr.git#commit=$_gitver")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git tag -a 0.1.12 -m 'Added Tag' 57766287256873ab843f1366258e139b5ccf9dbb 2> /dev/null
  git describe --tags | sed 's/-/_/g'
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
