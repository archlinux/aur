# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=python-pyld
_pkgname='pyld'
pkgver=2.0.4
pkgrel=1
pkgdesc="JSON-LD processor written in Python"
arch=('any')
url="https://github.com/digitalbazaar/pyld"
license=('BSD')
depends=('python-frozendict' 'python-aiohttp' 'python-lxml' 'python-requests' 'python-cachetools')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/digitalbazaar/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('d57ef3dbbd25eac8d42521c7a2b7c43d56ee6f5330b43267e178c78c0f28adf4f38c0b6863a891e3de3e6810991fa4fd3f2c4d2f2a1d19c891fa708dffce8edf')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
