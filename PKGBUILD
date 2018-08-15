# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-pyvisa-py-git python2-pyvisa-py-git)
pkgver=0.2.r153.g985e470
pkgrel=1
pkgdesc="A pure python backend for PyVISA"
arch=('any')
url="https://github.com/pyvisa/pyvisa-py"
license=('MIT')
makedepends=('git')

_gitroot='https://github.com/pyvisa/pyvisa-py.git'
_gitname='pyvisa-py'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
}

package_python-pyvisa-py-git() {
  depends=('python' 'python-distribute' 'python-docutils' 'python-pyvisa')
  provides=('python-pyvisa-py')
  conflicts=('python-pyvisa-py')
  optdepends=(
    'python-pyvisa-py: Pure Python backend'
  )

  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

package_python2-pyvisa-py-git() {
  depends=('python2' 'python2-distribute' 'python2-docutils' 'python2-pyvisa')
  provides=('python2-pyvisa-py')
  conflicts=('python2-pyvisa-py')
  optdepends=(
    'python2-pyvisa-py: Pure Python backend'
  )

  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

