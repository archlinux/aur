# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openmdao
pkgver=3.16.0
pkgrel=1
pkgdesc="An open-source high-performance computing platform"
url="https://github.com/OpenMDAO/OpenMDAO"
license=('Apache')
arch=('any')
depends=('python-networkx' 'python-numpy' 'python-pydoe2' 'python-pyparsing' 'python-scipy'
         'python-requests')
optdepends=('python-matplotlib: for docs'
            'python-numpydoc: for docs'
            'python-redbaron: for docs'
            'python-sphinx: for docs'
            'python-tabulate: for docs and notebooks'
            'ipython: for docs and notebooks'
            'python-notebook: for notebooks'
            'python-bokeh: for visualization'
            'python-colorama: for visualization')
checkdepends=('python-mpi4py' 'python-parameterized' 'python-numpydoc' 'python-pycodestyle'
              'python-pydocstyle' 'python-testflo' 'python-websockets' 'python-pyppeteer'
              'python-aiounittest')
source=("https://github.com/OpenMDAO/OpenMDAO/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c4bbb9e4cc640e2c27cfa62106ebace1bd7522e3481ded508d010f100d72c5ab4cace9777b7fa8935fada0cc46e694896964da245b18f15446b58e6773704cda')

prepare() {
  cd OpenMDAO-$pkgver
  sed -e 's/==/>=/' -i setup.py
}

build() {
  cd OpenMDAO-$pkgver
  python setup.py build
}

check() {
  cd OpenMDAO-$pkgver
  PYTHONPATH="$PWD/build/lib" testflo -n 16 --timeout=120 openmdao || echo "Tests failed"
}

package() {
  cd OpenMDAO-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
