# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Stunts <f.pinamartins[at]gmail.com>
# Contributor: Phil Schaf <flying-sheep[at]web.de>
# Contributor: Carl George < arch at cgtx dot us >

_pkgname=async-timeout
pkgname=python-${_pkgname}-git
pkgver=4.0.0.r2.g77f0cba
pkgrel=1
pkgdesc='Asyncio-compatible timeout class'
url='https://github.com/aio-libs/async-timeout'
arch=('any')
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-asyncio' 'python-pytest-aiohttp')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${_pkgname}::git+${url})
sha256sums=('SKIP')

build() {
  cd ${_pkgname}
  python setup.py build
}

check() {
  cd ${_pkgname}
  PYTHONPATH=. py.test tests
}


package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
