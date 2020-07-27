# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=anymeal
pkgver=1.5
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
sha256sums=('b9e19644f03ddb5c3cb436b59b8f8891a17d412faf68a94ddbecad40e97542fb')

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