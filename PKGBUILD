# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.23.3
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('openblas: faster linear algebra')
makedepends=('python-setuptools' 'gcc-fortran' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
options=('staticlibs')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('e690ea2906c91e567df2c801fbfe41652dabd37208faa99d6e068bda423dcc9f88be013478e9b6c1a339c36ef4c44b07a067d44e4e9c4b2e4f1344cbcb0598a9')

build() {
  cd numpy-$pkgver
  python setup.py build
}

check() {
  cd numpy-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.10/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/python-numpy/
}
