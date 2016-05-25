# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=mdbtools-git
pkgver=0.7.r198.gbd88fb7
pkgrel=1
pkgdesc="A set of libraries and utilities for reading Microsoft Access database (MDB) files."
arch=('i686' 'x86_64')
url="https://github.com/brianb/mdbtools"
depends=('gnome-doc-utils' 'libgnomeui')
makedepends=('git' 'txt2man')
provides=('mdbtools')
conflicts=('mdbtools')
license=('GPL')
options=('!emptydirs')
install=${pkgname}.install
source=("${pkgname}::git://github.com/brianb/mdbtools.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git describe --always | sed -r 's|([^-]*-g)|r\1|;s|-|.|g')
}

prepare() {
  cd ${pkgname}
  autoreconf -fi
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr \
    --disable-maintainer-mode \
    --disable-dependency-tracking
  make V=0
}

package(){
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "src/gmdb2/gmdb.desktop" "${pkgdir}/usr/share/applications/gmdb.desktop"
}
