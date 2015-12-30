pkgdesc="Standalone Python library for the catkin build system"
url='http://wiki.ros.org/catkin_pkg'
_name='catkin_pkg'
pkgname='python2-catkin-pkg'
pkgver=0.2.10
arch=('any')
pkgrel=1
license=('BSD')
makedepends=('ros-build-tools' 'python2-setuptools')
replaces=(python2-catkin_pkg)
conflicts=(python2-catkin_pkg)
provides=(python2-catkin_pkg)

source=("https://pypi.python.org/packages/source/c/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d4d069eaeb29d6a9ee71773b20c41515b6e0feb9ea2765ebaf3e599d0ceef050')

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

