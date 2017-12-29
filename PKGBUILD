# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-ivi-git python2-ivi-git)
pkgver=0.14.9.r97.gcfa45ce
pkgrel=1
pkgdesc="Python Interchangeable Virtual Instrument Library"
arch=('any')
url="https://github.com/python-ivi/python-ivi"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')

_gitroot='https://github.com/python-ivi/python-ivi.git'
_gitname='python-ivi'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python-ivi-git() {
  depends=('python' 'python-numpy')
  provides=('python-ivi')
  conflicts=('python-ivi')
  optdepends=(
    'python-vxi11: VXI11 instrument support'
    'python-usbtmc: USBTMC instrument support'
    'python-pyvisa: PyVISA interface for NI drivers'
  )

  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

package_python2-ivi-git() {
  depends=('python2' 'python2-numpy')
  provides=('python2-ivi')
  conflicts=('python2-ivi')
  optdepends=(
    'python2-vxi11: VXI11 instrument support'
    'python2-usbtmc: USBTMC instrument support'
    'python2-pyvisa: PyVISA interface for NI drivers'
  )

  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

