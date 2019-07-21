# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.8.1
pkgrel=1
pkgdesc="A CalDAV and CardDAV adapter for EteSync "
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/"
license=('GPL')
depends=('python-appdirs'
         'python-etesync'
         'radicale'
         'python-flask'
         'python-flask-wtf'
)
replaces=('python-radicale-storage-etesync')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/e/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b9f227b092b7fb9228e724adb1b7fdfad4dad4f18a8b4fbf8abb72ba5113c61dce2e151e31fb282996e889d81f8f017e43074fc61298377928e3524f91a7b408')

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

