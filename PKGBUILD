# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>
# Contributor: Martin Weinelt <hexa at darmstadt dot ccc dot de>
 
_appname=Quaternion
pkgname=quaternion
pkgver=0.0.95.1
_suffix=""
pkgrel=1
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'libquotient>=0.6')
optdepends=('qtkeychain')
makedepends=('cmake')
provides=('quaternion')
conflicts=('quaternion-git')
source=("https://github.com/quotient-im/Quaternion/archive/refs/tags/${pkgver}${_suffix}.tar.gz")
sha512sums=('465e49b90fef88b252f26b5791c2d491bfa451dd3b876b1fce8732bf96276437343fd368d1d48d20a2b5ec993a3e0a36709232f60fadd176548a7b942b22b678')

build() {
  cd "${_appname}-${pkgver}${_suffix}"
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
  cd "${_appname}-${pkgver}${_suffix}"
  cmake --build build -- DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
