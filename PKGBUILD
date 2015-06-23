_pkgname=upnp
pkgname=vdr-plugin-$_pkgname
pkgver=1.0.0
revision=1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="For archvdr project!!! UPnP plugin for VDR"
url="http://projects.vdr-developer.org/projects/plg-upnp/"
license="GPL"
makedepends=('vdr' )
depends=('vdr>=1.7.15' 'libupnp' 'sqlite' 'boost-libs' 'tnt' 'tntnet' 'tntdb')
source=(http://projects.vdr-developer.org/attachments/download/1188/vdr-upnp-$pkgver.tgz)
backup=()
conflicts=('vdr-plugin-upnp-git')
build() {
  unset CXXFLAGS

  cd ${srcdir}/$_pkgname-${pkgver}
  
  mkdir -p $pkgdir/usr/lib/vdr/plugins/ || return 1
  sed -i Make.config -e 's/VDRPLUGINLIBDIR\ ?=\ \/usr/VDRPLUGINLIBDIR\ ?=\ $(DESTDIR)\/usr/'
  sed -i Make.config -e 's/VDRCFGDIR\ ?=\ \/etc/VDRCFGDIR\ ?=\ $(DESTDIR)\/etc/'
  
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" all || return 1
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" DESTDIR=$pkgdir   install || return 1
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" DESTDIR=$pkgdir install-subplugins || return 1
}
md5sums=('ee35a4690cc0cb67a1e314807c1b5664')
