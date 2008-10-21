# Maintainer: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=1.1.0
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=(i686 x86_64)
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
depends=('evolution-data-server>=1.2' 'nautilus>=2.20')
makedepends=('pidgin' 'gajim' 'gettext' 'perlxml')
options=('!libtool')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-sendto/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fb2e115a33653496416847c61477b857')

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
