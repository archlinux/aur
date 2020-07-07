# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=anymeal
pkgver=1.3
pkgrel=1
pkgdesc='A recipe database software'
arch=('x86_64')
url='https://wedesoft.github.io/anymeal'
license=('GPL3')
depends=('hicolor-icon-theme'
         'recode'
         'qt5-webkit')
makedepends=('qt5-base'
             'recode'
             'gtest')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/wedesoft/anymeal/archive/v${pkgver}.tar.gz")
sha256sums=('3ff12e0e66340a0e719f03ebd958ed55b3494ced728c1077a46de7c2fdfb232b')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "24s|googletest/googletest|googletest|" configure.ac
}

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: