# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corestuff
pkgver=4.5.0
pkgrel=2
pkgdesc="An activity viewer from the C Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxcomposite' 'kglobalaccel5' 'libcsys>=2.7.1' 'libcprime>=2.7.1')
makedepends=('cmake' 'ninja')
replaces=('corebox')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('e4151ee3b5c3e1a5aec42a90aa167f24')

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
