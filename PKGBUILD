# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>
# Contributor: Martin Weinelt <hexa at darmstadt dot ccc dot de>
 
_appname=Quaternion
pkgname=quaternion
pkgver=0.0.9.5
_beta_suffix="beta2"
pkgrel=2
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'libquotient>=0.6')
makedepends=('cmake')
provides=('quaternion')
conflicts=('quaternion-git')
source=("https://github.com/quotient-im/Quaternion/archive/$pkgver-$_beta_suffix.tar.gz")
sha512sums=('3456973d03c0315105e108ef9ff176ef9a434f96962fb98c8eaf62f46ae9695e2811cb9b180fa9d1e162c300df6812d6e83dae4102aedc6aa6b5242b67b5bad3')

build() {
  cd ${_appname}-${pkgver}-$_beta_suffix
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
  cd ${_appname}-${pkgver}-$_beta_suffix
  cmake --build build -- DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
