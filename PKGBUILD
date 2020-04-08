# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>
# Contributor: Martin Weinelt <hexa at darmstadt dot ccc dot de>
 
_appname=Quaternion
pkgname=quaternion
pkgver=0.0.9.4e
pkgrel=1
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'libQuotient>=0.5.3.2')
makedepends=('cmake')
provides=('quaternion')
conflicts=('quaternion-git')
source=("https://github.com/quotient-im/Quaternion/archive/$pkgver.tar.gz")
sha256sums=('e489f331b49f18e0554b60070e61b7c9')

build() {
  cd ${_appname}-${pkgver}
  cmake -H. -Bbuild \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DUSE_INTREE_LIBQMC=OFF

  cmake --build build
}

package() {
  cd ${_appname}-${pkgver}
  cmake --build build -- DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
