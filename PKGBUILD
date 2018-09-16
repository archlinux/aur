# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

_name="radicale_storage_etesync"
pkgname="python-radicale-storage-etesync"
pkgver=0.1.7
pkgrel=1
pkgdesc="An EteSync storage plugin for Radicale"
arch=('any')
url="https://pypi.python.org/pypi/${_name}/"
license=('GPL')
depends=('python-etesync'
         'radicale'
)
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/r/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('644b427e20a835f84605d9d8e882d2e803a288060ef8f18be9128e84926d9c664a216d2321e61cf2c869a61217e29d362ac594d54bf5d3f3bb39e6c089ab37f7')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

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

