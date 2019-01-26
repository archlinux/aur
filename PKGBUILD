# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

_name="radicale_storage_etesync"
pkgname="python-radicale-storage-etesync"
pkgver=0.2.0
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
sha512sums=('41fc0629a5a5468099a6093a4ec6c931185a67abc010263b635ff23db7cc40f9ec4d350726993f408ae053d3c06bcbe2dd229ff047f990b40021a16e893f9afc')

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

