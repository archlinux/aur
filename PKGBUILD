# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-thriftpy2'
_pkgname=thriftpy2
pkgver=0.5.2
pkgrel=1
pkgdesc='A pure python implementation of Apache Thrift in a pythonic way'
arch=('x86_64')
url='https://thriftpy2.readthedocs.io'
license=('MIT')
makedepends=(cython python-build python-installer python-setuptools python-wheel)
depends=(python python-ply python-six python-tornado)
checkdepends=(python-pytest python-pytest-asyncio python-pytest-reraise python-tornado)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('cefcb2f6f8b12c00054c6f942dd2323a53b48b8b6862312d03b677dcf0d4a6da')

build() {
  cd "$_pkgname-$pkgver"
  python -m build -wn
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --dest="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$_pkgname-$pkgver/tests"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/../build/lib.linux-$CARCH-cpython-$python_version" pytest

}
