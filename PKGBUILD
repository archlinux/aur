# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

_name="radicale_storage_etesync"
pkgname="python-radicale-storage-etesync"
pkgver=0.1.4
pkgrel=1
pkgdesc="An EteSync storage plugin for Radicale"
arch=('any')
url="https://pypi.python.org/pypi/${_name}/"
license=('LGPL')
depends=('python-etesync'
         'radicale'
)
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/r/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('4b79072019e70216e9c14ac3e212897f5fb4ea4ea8f4dcaea65d7d422bf564b0aa8d206163ad098f88ec72ed6ec03d27e30c82a0ee788118b4244c62fed04f1b')

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

