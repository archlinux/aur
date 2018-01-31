# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ng-jackspa
pkgver=1.0
pkgrel=5
pkgdesc="A set of LADSPA plugin hosts for JACK with graphical and terminal user interfaces"
arch=('i686' 'x86_64')
url="https://git.tuxfamily.org/legip/ng-jackspa.git/"
license=('GPL2')
depends=('gtkmm' 'jack' 'qt4')
makedepends=('gdb' 'ladspa')
source=(
    "ngjackspa-${pkgver}.tar.gz::https://git.tuxfamily.org/legip/ng-jackspa.git/plain/ngjackspa-${pkgver}.tar.gz?h=download"
    '0001-Makefile-do-not-disable-deprecated-glib-GTK-code.patch'
)
sha256sums=('4ec971f4aab03c8d8a63439bbabc220e36ee16cd0f29e89772066291daf13102'
            '9997bae7bd58bafa9fcd3e2b1f47a92687364fa83414feed4071063861b41637')


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
