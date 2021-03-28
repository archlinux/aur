# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-thriftpy2'
_pkgname=thriftpy2
pkgver=0.4.14
pkgrel=1
pkgdesc='A pure python implementation of Apache Thrift in a pythonic way'
arch=('any')
url='https://thriftpy2.readthedocs.io'
license=('MIT')
makedepends=('cython' 'python-setuptools')
depends=('python-ply')
checkdepends=('python-pytest' 'python-pytest-asyncio')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1758ccaeb2a40d8779b50cdd3d7a3b43e8c5752f21ad0a54ded7c251d05219e8')

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
  cd "tests"
  PYTHONPATH=.. pytest
}
