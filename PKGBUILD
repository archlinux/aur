# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=('python-pytenable')
_pyname=pyTenable
depends=('python-defusedxml' 'python-requests' 'python-dateutil' 'python-semver' 'python-ipaddress' 'python-requests-pkcs12')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
optdepends=('python-docker: Docker support')
pkgver=1.1.1
pkgrel=1
pkgdesc="Python library to interface into Tenable's products and applications"
arch=('any')
url="https://github.com/tenable/pyTenable/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/tenable/pyTenable/archive/${pkgver}.tar.gz")
sha512sums=('96eef23caf0155df70e00eabb90ecb30e991b5d24f600f925c1390b4496fa60a619ee3e2c4e239a24117e2828d26770548e3ec4257ac05026a86f76f9e332c2e')

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

