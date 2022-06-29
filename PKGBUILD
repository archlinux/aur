# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python2-trustme
_name=${pkgname#python2-}
pkgver=0.9.0
pkgrel=5
pkgdesc='Library for fake certificate authority (CA) to generate fake TLS certs (Python 2 package)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=(
  'python2'
  'python2-cryptography'
  'python2-idna'
)
makedepends=('python2-setuptools')
checkdepends=(
  'python2-pyopenssl'
  'python2-pytest'
  'python2-service-identity'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}::https://github.com/python-trio/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('970700274ac25b9871b53bba4ddbac2d22bb9db672012fd1216726091c39fd901023c93b9c1b49cb2f90a9610f7f64d76ef9c9a1509282f9bbc944d56a352ff2')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  export PYTHONPATH=$(pwd)
  py.test2
}

package() {
  cd "${_tarname}"
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE.MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
