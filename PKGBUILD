# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=console-bridge
pkgver=0.2.7
pkgrel=7
pkgdesc="A ROS-independent package for logging that seamlessly pipes into rosconsole/rosout for ROS-dependent packages."
arch=('any')
url="http://www.ros.org/"
license=('BSD')
depends=('boost')
makedepends=('cmake')

source=("https://github.com/ros/console_bridge/archive/${pkgver}.tar.gz")
sha256sums=('9145f0f97337fc87b4c062a4bab6874e383dad3a303486b635d31af69ee0d536')

build() {
  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake "${srcdir}/console_bridge-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="$pkgdir/" install
}
