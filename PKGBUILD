# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corestuff
pkgver=4.3.0
pkgrel=1
pkgdesc="An activity viewer from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxcomposite' 'kglobalaccel' 'libcsys>=2.7.1' 'libcprime>=2.7.1')
makedepends=('cmake' 'ninja')
replaces=('corebox')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('bbcbfa3b8f9f085fe9232f8f81ab53b3')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
} 
