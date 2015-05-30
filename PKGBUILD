# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: bzt <unmacaque@gmail.com>

pkgname=gcalctool-oldgui
pkgver=5.30.2
_majver=5.30
pkgrel=1
pkgdesc="GCalctool is an application that solves mathematical equations and is suitable as a default application in a Desktop environment."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2>=2.14.0' 'gconf-gtk2')
makedepends=('intltool' 'gnome-doc-utils>=0.8.0')
url="https://webstats.gnome.org/Gcalctool"
source=("https://download.gnome.org/sources/gcalctool/${_majver}/gcalctool-${pkgver}.tar.bz2")
md5sums=('9357de6835da305ee4f0ebad509b509a')
provides=('gcalctool' 'gnome-calculator')
conflicts=('gcalctool' 'gnome-calculator')

build() {
  cd "${srcdir}/${provides}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-scrollkeeper
  make V=0
}

package() {
  cd "${srcdir}/${provides}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
}
