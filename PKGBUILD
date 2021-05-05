# Maintainer: Tom Zander

pkgname=flowee-pay-git
pkgver=2021.04.0.r5.g4848ac7
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('boost' 'cmake' 'flowee-libs')
provides=('flowee-pay')
source=("git+https://gitlab.com/FloweeTheHub/pay.git#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pay"
  git describe --long --tags | sed 's/v\(.*\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../pay
  make
}

package() {
  cd build
  make install
}
