# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

_name="radicale_storage_etesync"
pkgname="python-radicale-storage-etesync"
pkgver=0.7.0
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
sha512sums=('ef38aad5eacafb0f08a8b98b91779a105c7965e4f9ba71c20add3288b6fabcf73afa150c5321d14658aa3e789a19caa59854654f8c29a835770c5942e80fce20')

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

