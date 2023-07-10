# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-thriftpy2'
_pkgname=thriftpy2
pkgver=0.4.16
pkgrel=1
pkgdesc='A pure python implementation of Apache Thrift in a pythonic way'
arch=('x86_64')
url='https://thriftpy2.readthedocs.io'
license=('MIT')
makedepends=('cython' 'python-setuptools')
depends=('python-ply' 'python-six' 'python-tornado')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-tornado')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2aa67ecda99a948e4146341d388260b48ee7da5dfb9a951c4151988e2ed2fb4c')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py build_ext --inplace
  cd tests
  PYTHONPATH="${srcdir}/$_pkgname-$pkgver" pytest
}
