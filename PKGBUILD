# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ng-jackspa
pkgver=1.0
pkgrel=3
pkgdesc="A set of LADSPA plugin hosts for JACK with graphical and terminal user interfaces"
arch=('i686' 'x86_64')
url="https://gna.org/projects/ngjackspa"
license=('GPL2')
depends=('gtkmm' 'jack' 'qt4')
makedepends=('gdb' 'ladspa')
source=(
    "http://repo.or.cz/ng-jackspa.git/blob_plain/refs/heads/download:/ngjackspa-${pkgver}.tar.gz"
    '0001-Makefile-do-not-disable-deprecated-glib-GTK-code.patch'
)
sha256sums=('82cc502c7ca1c19f2581cc1a2a41645419ab9566d65c8c4c4c1d88467570cf6a'
            '0e240ab9d1703e55f2aef16bad93d7184f8b2ec3928535ff0423f433abf01de0')


prepare() {
  cd "${srcdir}/ngjackspa-${pkgver}"

  patch -p1 -i "${srcdir}/0001-Makefile-do-not-disable-deprecated-glib-GTK-code.patch"
}

build() {
  cd "${srcdir}/ngjackspa-${pkgver}"

  make QMAKE="qmake-qt4" prefix=/usr
}

package() {
  cd "${srcdir}/ngjackspa-${pkgver}"

  make prefix=/usr DESTDIR="${pkgdir}" install install-doc
}
