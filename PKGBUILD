# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=('pypy3-cython' 'pypy-cython')
pkgbase=pypy-cython
pkgver=0.22
pkgrel=1
pkgdesc="C-Extensions for PyPy"
arch=('i686' 'x86_64')
url="http://www.cython.org"
license=('APACHE')
makedepends=('pypy3' 'pypy')
source=("http://cython.org/release/Cython-$pkgver.tar.gz")
md5sums=('1ae25add4ef7b63ee9b4af697300d6b6')

build() {
  cd "$srcdir"
  cp -a "Cython-$pkgver" "Cython-pypy3"
  mv "Cython-$pkgver" "Cython-pypy"
}

package_pypy3-cython() {
  depends=('pypy3')

  cd "$srcdir/Cython-pypy3"
  pypy3 setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir/usr"
  mv "$pkgdir/opt/pypy3/bin" "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"

  sed -i 's|#!.*python|#!/usr/bin/pypy3|' *
  for i in cython cythonize cygdb; do
    mv $i $i-pypy3
  done
}

package_pypy-cython() {
  depends=('pypy')

  cd "$srcdir/Cython-pypy"
  pypy setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir/usr"
  mv "$pkgdir/opt/pypy/bin" "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"

  sed -i 's|#!.*python|#!/usr/bin/pypy|' *
  for i in cython cythonize cygdb; do
    mv $i $i-pypy
  done
}
