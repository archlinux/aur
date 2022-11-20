# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python38-numpy
pkgver=1.23.4
pkgrel=1
pkgdesc="Scientific tools for Python 3.8"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python38')
optdepends=('openblas: faster linear algebra')
makedepends=('python38-setuptools' 'gcc-fortran' 'python38-cython')
checkdepends=('python38-pytest' 'python38-hypothesis')
options=('staticlibs')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('727ca8950b0fbd5670e939b1c9c5cea852781ec4254d56a1659a91dc0430fc10b01ffdd16e1bb28a62319f91029e087024f4c6298bfc859a6050bfb507edcff8')

build() {
  cd numpy-$pkgver
  python3.8 setup.py build
}

check() {
  cd numpy-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.8/site-packages:$PYTHONPATH" python3.8 -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/python38-numpy/
}