pkgdesc="Standalone Python library for the catkin build system"
url='http://wiki.ros.org/catkin_pkg'
_name='catkin_pkg'
pkgname='python2-catkin-pkg'
pkgver=0.2.9
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools')
replaces=(python2-catkin_pkg)
conflicts=(python2-catkin_pkg)
provides=(python2-catkin_pkg)

source=("https://pypi.python.org/packages/source/c/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('66b484e850748b38a5a66f70debc4914')

build() {
  # Fix Python3 error
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_name}

  cd ${srcdir}/${_name}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_name}-${pkgver}
  python2 setup.py install -O2 --skip-build --prefix=/usr --root=${pkgdir}
}

