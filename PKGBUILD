# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.5.0
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
sha512sums=('c092d78712c164883477c2e716523854f4c5ec319e1e553c9a1a344cd360db39ac82221d09400169baef4ad2ec0d5dcde3047a7cd86fd69fefa678a86c993ece')

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

