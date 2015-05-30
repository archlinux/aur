# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: bzt <unmacaque@gmail.com>

pkgname=gcalctool-oldgui
_pkgname=gcalctool
pkgver=6.0.2
_majver=6.0
pkgrel=1
pkgdesc="GCalctool is an application that solves mathematical equations and is suitable as a default application in a Desktop environment."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2>=2.14.0' 'dconf')
makedepends=('intltool' 'gnome-doc-utils>=0.8.0')
url="https://webstats.gnome.org/Gcalctool"
install=$_pkgname.install
source=("https://download.gnome.org/sources/$_pkgname/${_majver}/$_pkgname-${pkgver}.tar.bz2")
provides=("$_pkgname" 'gnome-calculator')
conflicts=("$_pkgname" 'gnome-calculator')
md5sums=('53156dd96aeeecf6a2669292025de75c')

build() {
  cd "${srcdir}/${provides}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--disable-scrollkeeper \
	--with-gtk=2.0
  make V=0
}

package() {
  cd "${srcdir}/${provides}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
}
