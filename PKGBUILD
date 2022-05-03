pkgname=pypy3-numpy
pkgver=1.22.3
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'pypy3')
optdepends=('openblas: faster linear algebra')
makedepends=('pypy3-setuptools' 'gcc-fortran' 'pypy3-cython')
options=('staticlibs')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('59424fe1d0f8288adc21a19aef2c0d89aeddb737a27bc3ca02576978ff2d00ae71aef34846df28d84b7a546dd197cf52c865350b76b2432333cf46218d502a0d')

build() {
  cd numpy-$pkgver
  pypy3 setup.py build
}

package() {
  cd numpy-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/pypy3-numpy/

  install -d "$pkgdir"/usr/bin
  cd "$pkgdir/opt/pypy3/bin"
  for i in f2py f2py3 f2py3.8; do
    mv $i "$pkgdir"/usr/bin/$i-pypy3
  done
}
