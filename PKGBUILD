_name=scipy
pkgname=pypy3-scipy
pkgver=1.8.0
pkgrel=1
pkgdesc='Open-source software for mathematics, science, and engineering'
arch=(x86_64)
url='https://www.scipy.org/'
license=(BSD)
depends=(pypy3-numpy)
provides=(scipy)
makedepends=(gcc-fortran pypy3-setuptools pypy3-cython pypy3-pythran pypy3-pybind11)
source=(https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('31d4f2d6b724bc9a98e527b5849b8a7e589bf1ea630c33aa563eda912c9ff0bd')

build() {
  cd scipy-${pkgver}
  pypy3 setup.py config_fc build
}

package() {
  cd scipy-$pkgver
  pypy3 setup.py config_fc install \
    --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/pypy3-$pkgname
}
