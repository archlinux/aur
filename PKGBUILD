# Maintainer: Jonathan Eyolfson <jon@eyl.io>
pkgname=dynamorio
pkgver=5.0.0
pkgrel=1
pkgdesc="Foo is an example package for this PKGBUILD file."
url="http://dynamorio.org"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
optdepends=()
makedepends=('cmake' 'perl')
conflicts=()
replaces=()
backup=()
source=("https://github.com/DynamoRIO/dynamorio/archive/release_${pkgver//./_}.tar.gz")
sha256sums=('0ce079bc2717cbf9da1a8c3fb528c1c5c1469f7b709c9e4f01e117b75f40b36a')

build() {
  cd "${srcdir}/${pkgname}-release_${pkgver//./_}" && mkdir build && cd build
  cmake .. -DDISABLE_WARNINGS=ON \
           -DINSTALL_PREFIX=/opt/dynamorio \
           -DBUILD_TOOLS=ON \
           -DBUILD_SAMPLES=ON \
           -DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/dynamorio"
  make
}

package() {
  cd "${srcdir}/${pkgname}-release_${pkgver//./_}/build"
  make install
  cd "${pkgdir}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv opt/dynamorio/License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
