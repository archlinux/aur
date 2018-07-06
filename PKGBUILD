# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=asyncio_extras
pkgname='python-asyncio_extras'
pkgver='1.3.2'
pkgrel='1'
pkgdesc='Asynchronous generators and context managers for asyncio'
arch=('any')
url='https://pypi.python.org/pypi/asyncio_extras'
license=('MIT')
depends=('python' 'python-async_generator')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-asyncio')

source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('084b62bebc19c6ba106d438a274bbb5566941c469128cd4af1a85f00a2c81f8d')

build() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix="/usr"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}
# vim:set ts=2 sw=2 et:
