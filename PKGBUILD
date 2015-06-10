# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=qtcreator-googletest-plugin-git
pkgver=r15.e721079
pkgrel=1
pkgdesc="QtCreator plugin using Google Test"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="http://gres.biz/qtc-gtest/"
license=('MIT')
depends=('qtcreator' 'gtest')
replaces=()
provides=('qtcreator-googletest-plugin')
conflicts=()
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/OneMoreGres/qtc-gtest.git#branch=master)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # use the revision count.hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake LIBS+="-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}/usr" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
