# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=('python-pytenable')
_pyname=pyTenable
depends=('python-defusedxml' 'python-requests' 'python-dateutil' 'python-semver' 'python-ipaddress' 'python-requests-pkcs12' 'python-restfly' 'python-box' 'python-marshmallow')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
optdepends=('python-docker: Docker support')
pkgver=1.2.2
pkgrel=1
pkgdesc="Python library to interface into Tenable's products and applications"
arch=('any')
url="https://github.com/tenable/pyTenable/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/pyTenable/archive/${pkgver}.tar.gz")
sha512sums=('2c700871a0e374550cbaa568440bcae48ac3d187cbf6faa7039479c4f631b2701bb5bfcde7eed7e6c25fab18db99056d7eb885c54bcfc09c7de965663fcb523c')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

