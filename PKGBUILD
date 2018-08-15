# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-pyvisa python2-pyvisa)
pkgver=1.9.1
pkgrel=1
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' VISA library"
arch=('any')
url="https://github.com/pyvisa/pyvisa"
license=('MIT')
depends=('python' 'python-distribute' 'python-docutils')
optdepends=(
  'python-pyvisa-py: Pure Python backend'
)

source=("pyvisa-$pkgver.tar.gz::https://github.com/pyvisa/pyvisa/archive/$pkgver.tar.gz")
md5sums=('cb53183a78b69ef0cbb8099d5019a91c')

build() {
  cd "$srcdir/pyvisa-$pkgver"
}

package_python-pyvisa() {
  depends=('python' 'python-distribute' 'python-docutils')
  optdepends=(
    'python-pyvisa-py: Pure Python backend'
  )

  cd "$srcdir/pyvisa-$pkgver"
  sed -i "s/'.*pyvisa-shell=/'python-pyvisa-shell=/" setup.py
  sed -i "s/'.*pyvisa-info=/'python-pyvisa-info=/" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  cd "$pkgdir/usr/bin"
  ln -s python-pyvisa-shell pyvisa-shell
  ln -s python-pyvisa-info pyvisa-info
}

package_python2-pyvisa() {
  depends=('python2' 'python2-distribute' 'python2-docutils')
  optdepends=(
    'python2-pyvisa-py: Pure Python backend'
  )

  cd "$srcdir/pyvisa-$pkgver"
  sed -i "s/'.*pyvisa-shell=/'python2-pyvisa-shell=/" setup.py
  sed -i "s/'.*pyvisa-info=/'python2-pyvisa-info=/" setup.py
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

