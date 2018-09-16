# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.1.7
pkgrel=1
pkgdesc="A CalDAV and CardDAV front-end/proxy for EteSync "
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/"
license=('GPL')
depends=('python-appdirs'
         'python-radicale-storage-etesync'
)
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/e/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('61e490050ddca99344817d65b9a779868d505b2935da296de40df667187ce64d82335d1fd748a24fc8c74e9baf92d4b5779d000bb609f46e90d1016efaf7730b')

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

