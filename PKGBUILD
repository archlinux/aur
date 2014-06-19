# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=urdfdom-headers
pkgver=0.3.0
pkgrel=1
pkgdesc="The URDF (U-Robot Description Format) headers provides core data structure headers for URDF."
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('BSD')
depends=()
makedepends=('git' 'cmake')

_gitroot=https://github.com/ros
_gitrepo=urdfdom_headers

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
