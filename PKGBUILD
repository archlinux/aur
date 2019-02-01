# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.2.1
pkgrel=1
pkgdesc="A CalDAV and CardDAV adapter for EteSync "
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/"
license=('GPL')
depends=('python-appdirs'
         'python-radicale-storage-etesync'
)
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/e/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e39fe36bd100b870ad8d904a2d90f1777c93dada8acf5808ddafdf23d2bcce5feff37c4bd60d3551ffd0c75897f6939d0973bb54db4e4542e748b8c006d6b65f')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {DESCRIPTION.rst,README.md}
}

