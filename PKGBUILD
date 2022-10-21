# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Tobias Simetsreiter <tobias@tsimnet.eu>

pkgname=python-pybluez-git
_gitname=pybluez
pkgver=0.22.r242.g4d46ce1
pkgrel=1
pkgdesc='Python wrapper for the BlueZ Bluetooth stack'
arch=('any')
url='https://github.com/pybluez/pybluez'
license=('GPL')
depends=('python' 'bluez-libs')
makedepends=('boost' 'git' 'python-setuptools')
provides=('python-pybluez')
conflicts=('python-pybluez')
source=('git+https://github.com/pybluez/pybluez.git'
        'git+https://github.com/oscaracena/pygattlib.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd pygattlib
  sed 's/boost_python-py34/boost_python3/g' setup.py > new_setup.py
  mv new_setup.py setup.py
  python setup.py install --root="$pkgdir"
  cd "$srcdir/${_gitname}"
  python setup.py install --root="$pkgdir"
#  ln -s bluetooth/_bluetooth.so $pkgdir/usr/lib/python3.3/site-packages/_bluetooth.so
}
