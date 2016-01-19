# $Id$
# Maintainer: Sylvain Agostini <sylvain@agoremix.com>

pkgname=rkward
pkgver=0.6.4
pkgrel=1
pkgdesc="KDE easy to use and easily extensible IDE/GUI for R"
url="http://rkward.kde.org/"
arch=('i686' 'x86_64')
license=('GPL')
groups=('kde-applications' 'kdeedu')
depends=('kdebase-runtime' 'r' 'katepart4')
makedepends=('extra-cmake-modules' 'automoc4')
optdepends=()
conflicts=()
source=("http://download.kde.org/stable/rkward/${pkgver}/src/rkward-${pkgver}.tar.gz")
sha1sums=('9238bc2b9cf750f961a72e0bb1a66654453f93bc')
install=$pkgname.install

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DR_LIBDIR=/usr/lib/R/library
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  rm -vf "${pkgdir}/usr/share/apps/katepart/syntax/r.xml"
}

