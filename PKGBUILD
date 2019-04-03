# Maintainer: Denis Alevi <mail at denisalevi dot de>

pkgname=python-httpsig
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=2
pkgdesc='Secure HTTP request signing using the HTTP Signature draft specification'
url='https://github.com/ahknight/httpsig'
arch=('any')
license=('MIT')
depends=('python-pycryptodome')
optdepends=('python-requests')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/ahknight/httpsig/archive/v$pkgver.tar.gz")
md5sums=('dbf9a9464b8ec06c89756d088cdc9810')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py test
}

# vim:set sw=2 sts=2 et:
