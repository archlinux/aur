# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=1.11.0
pkgrel=1
pkgdesc="A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework."
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
depends=('qt5-base' 'grantlee' 'uwsgi')
makedepends=('cmake' 'doxygen' 'graphviz')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}"

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DUWSGI_PLUGINS_DIR=/usr/lib/uwsgi \
    -DCMAKE_INSTALL_PREFIX=/usr ".."
  make
}

package_cutelyst-docs() {
  pkgdesc="Doxygen HTML API Documentation"
  cd "$srcdir/${pkgbase}-${pkgver}/build"

  make docs

  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst/html/
  install -m644 apidox/* ${pkgdir}/usr/share/doc/cutelyst/html/
}

package_cutelyst() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

sha512sums=('30978e18713679f77772a75864c4245fcb5f4857e8452e12de5dd65f256c6337cfb905f6b2cb9d0dcfe646c0c9557c6485cbdb04b4f34b93dd9fbd9d2193d6d7')
