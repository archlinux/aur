# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=2.2.1
pkgrel=3
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
    -DPLUGIN_UWSGI=on \
    -DPLUGIN_VIEW_GRANTLEE=on \
    -DPLUGIN_CSRFPROTECTION=on \
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
sha512sums=('d4eb838a09ab9b2bb22dfe2753d3ca0844cfb1708e16dc705eb40bec13c23eab03c7972d716fe869ae903ef4a23b91cd7665e0252fcd78b095f0ad873745a242')
