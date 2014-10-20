# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=console-bridge
pkgver=0.2.7
pkgrel=2
pkgdesc="A ROS-independent package for logging that seamlessly pipes into rosconsole/rosout for ROS-dependent packages."
arch=('i686' 'x86_64')
url="http://www.ros.org/"
license=('BSD')
depends=('boost')
makedepends=('git' 'cmake')

_gitroot=https://github.com/ros
_gitrepo=console_bridge

_tag=${pkgver}
_dir=${_gitrepo}
source=("${_dir}"::"git+${_gitroot}/${_gitrepo}.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="$pkgdir/" install
}
