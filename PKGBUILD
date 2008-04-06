# $Id: PKGBUILD,v 1.12 2008/02/12 20:41:08 roman Exp $
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=0.13.2
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=(i686 x86_64)
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
depends=('evolution-data-server>=1.10.1-2' 'nautilus>=2.20')
makedepends=('pidgin' 'gajim' 'gettext' 'perlxml')
options=('!libtool')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-sendto/0.13/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7e8a79e6e51e4bf96318aa8f9a37044b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
 
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
    ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
