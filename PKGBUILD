# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-pyvisa-git python2-pyvisa-git)
pkgver=1.9.1.r1.g7d8c059
pkgrel=1
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' VISA library"
arch=('any')
url="https://github.com/pyvisa/pyvisa"
license=('MIT')
depends=('python' 'python-distribute' 'python-docutils')
makedepends=('git')

_gitroot='https://github.com/pyvisa/pyvisa.git'
_gitname='pyvisa'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
}

package_python-pyvisa-git() {
  depends=('python' 'python-distribute' 'python-docutils')
  provides=('python-pyvisa')
  conflicts=('python-pyvisa')
  optdepends=(
    'python-pyvisa-py: Pure Python backend'
  )

  cd "$srcdir/$_gitname"
  sed -i "s/'.*pyvisa-shell=/'python-pyvisa-shell=/" setup.py
  sed -i "s/'.*pyvisa-info=/'python-pyvisa-info=/" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  cd "$pkgdir/usr/bin"
  ln -s python-pyvisa-shell pyvisa-shell
  ln -s python-pyvisa-info pyvisa-info
}

package_python2-pyvisa-git() {
  depends=('python2' 'python2-distribute' 'python2-docutils')
  provides=('python2-pyvisa')
  conflicts=('python2-pyvisa')
  optdepends=(
    'python2-pyvisa-py: Pure Python backend'
  )

  cd "$srcdir/$_gitname"
  sed -i "s/'.*pyvisa-shell=/'python2-pyvisa-shell=/" setup.py
  sed -i "s/'.*pyvisa-info=/'python2-pyvisa-info=/" setup.py
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

