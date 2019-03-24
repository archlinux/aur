# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgbase=python-pyhdf
pkgname=('python-pyhdf' 'python2-pyhdf')
pkgver=0.10.1
pkgrel=1
pkgdesc='Python bindings for the HDF4 library'
arch=('x86_64')
license=('MIT')
url='https://github.com/fhs/pyhdf'
makedepends=('python' 'python2' 'python-numpy' 'python2-numpy' 'hdf4')
source=("https://pypi.io/packages/source/p/pyhdf/pyhdf-${pkgver}.tar.gz")
sha256sums=('c939cf92487c37da61b41867b4ab032711ccde407340f7ef7d18917631cf62b2')

prepare() {
  cp -a $srcdir/pyhdf-$pkgver{,-py2}
}

build() {
  export INCLUDE_DIRS="/opt/hdf4/include"
  export LIBRARY_DIRS="/opt/hdf4/lib"

  cd $srcdir/pyhdf-$pkgver
  python setup.py build

  cd $srcdir/pyhdf-$pkgver-py2
  python2 setup.py build
}

package_python-pyhdf() {
  depends=('python' 'python-numpy' 'hdf4')

  cd $srcdir/pyhdf-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pyhdf() {
  depends=('python2' 'python2-numpy' 'hdf4')

  cd $srcdir/pyhdf-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
