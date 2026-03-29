# Maintainer: Julian Houba <info@craftingdragon.ch>
# Contributor: Václav Kubernát <sir.venceslas@gmail.com> (maintainer of qt5 version)

pkgname=qt6-opcua
pkgver=6.11.0
pkgrel=1
pkgdesc='Qt 6 wrapper for existing OPC UA stacks'
arch=('x86_64' 'aarch64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('qt6-base' 'openssl')
makedepends=('git' 'cmake' 'ninja' 'qt6-declarative')
groups=('qt6')
_pkgfqn=qtopcua
source=("https://github.com/qt/$_pkgfqn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d676bd8428b5a8157b713672a14c91fa0e0420bac70980e3f268e6f6008cbd6')

build() {
  cmake -B build -S "$_pkgfqn-$pkgver" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DQT_FEATURE_open62541=ON \
    -DQT_BUILD_EXAMPLES=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Install licenses
  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/${pkgname}
}
