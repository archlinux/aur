_pyname=pyFFTW
pkgname="python-pyfftw"
pkgver=0.13.1
pkgrel=2
pkgdesc='A pythonic wrapper around FFTW.'
url='https://github.com/pyFFTW/pyFFTW'
depends=('fftw' 'python-numpy' 'python-scipy')
makedepends=('cython' 'python-setuptools')
license=('BSD')
arch=('i686' 'x86_64')
source=("$_pyname-$pkgver.tar.gz::https://github.com/pyFFTW/pyFFTW/archive/v$pkgver.tar.gz")
md5sums=('1e6c37d9d0d8e037908cf89ca3c0232b')

check() {
  cd $srcdir/$_pyname-$pkgver
  # comment to run extensive testsuite
  #python setup.py test
}

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
  python setup.py build_ext --inplace
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
