# $Id: PKGBUILD 66132 2012-02-23 01:40:38Z backpackjoe $
# Maintainer: Tobias Simetsreiter <tobias@tsimnet.eu>

pkgname=python-pybluez-git
_gitname=pybluez
pkgver=0.22.r52.g42070d9
pkgrel=1
pkgdesc="Python wrapper for the BlueZ Bluetooth stack"
arch=('any')
url="https://github.com/karulis/pybluez"
license=('GPL2')
makedepends=('python' 'bluez-libs' 'mercurial' 'boost')
depends=('python' 'bluez-libs')
conflicts=("python-pybluez")
source=("git+https://github.com/karulis/pybluez.git" "hg+https://bitbucket.org/OscarAcena/pygattlib")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/pygattlib"
  sed "s/boost_python-py34/boost_python3/g" setup.py > new_setup.py
  mv new_setup.py setup.py
  python setup.py install --root=$pkgdir
  cd "$srcdir/${_gitname}"
  python setup.py install --root=$pkgdir
#  ln -s bluetooth/_bluetooth.so $pkgdir/usr/lib/python3.3/site-packages/_bluetooth.so
}
