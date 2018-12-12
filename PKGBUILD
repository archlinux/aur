pkgname=python-robotarium-git
pkgver=r19.1ed474a
pkgrel=1
pkgdesc="A Python-based simulator for the Robotarium."
url="https://github.com/robotarium/robotarium_python_simulator"
arch=('x86_64')
license=('GPL3')
depends=('python' 'python-cvxopt' 'python-scipy' 'python-numpy' 'python-matplotlib')
makedepends=('python-setuptools')
source=('git+https://github.com/robotarium/robotarium_python_simulator.git')
sha256sums=('SKIP')
provides=('python-robotarium')
conflicts=('python-robotarium')

pkgver() {
  cd "$srcdir"/robotarium_python_simulator

  # Pull the version tag from the file
  printf "%s" "$(grep -R "__version__ =" autopep8.py | awk -F\' '{print $2}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/robotarium_python_simulator
  python setup.py build
}

package() {
  cd "$srcdir"/robotarium_python_simulator
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

