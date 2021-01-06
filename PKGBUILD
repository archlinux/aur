# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=('python-pytenable')
_pyname=pyTenable
depends=('python-defusedxml' 'python-requests' 'python-dateutil' 'python-semver' 'python-ipaddress' 'python-requests-pkcs12' 'python-restfly' 'python-box' 'python-marshmallow')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
optdepends=('python-docker: Docker support')
pkgver=1.2.6
pkgrel=1
pkgdesc="Python library to interface into Tenable's products and applications"
arch=('any')
url="https://github.com/tenable/pyTenable/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/pyTenable/archive/${pkgver}.tar.gz")
sha512sums=('03233ee606411413a3a75e7b22cafab0ca33dccdf8060e0c492839f16beaafd5e9302d42cba51cc39ea47b14562fc17081d3451b072fedac30d3bbc2533f2f4c')

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

