# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

_name="radicale_storage_etesync"
pkgname="python-radicale-storage-etesync"
pkgver=0.6.0
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
sha512sums=('ddcd36551a8b2aed4e88adf1f5284c49e1e5040e257663436ad7d454effd8c152cd5716468a5cc38a49dd9419d5fdda69dec4ca4248820f364bec52ba554efac')

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

