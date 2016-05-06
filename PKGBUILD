# $Id$
# Maintainer: Sylvain Agostini <sylvain@agoremix.com>

pkgname=rkward
pkgver=0.6.5
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
sha1sums=('562cb7a0abdb46f5ed21e4344bb566d759f88f43')
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

