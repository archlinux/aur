# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-aesedb
_pkgname=aesedb
pkgver=0.1.6
pkgrel=1
pkgdesc="Asynchronous parser for JET."
url="https://github.com/skelsec/aesedb"
arch=('any')
license=('MIT')
depends=('python' 'python-unicrypto' 'python-aiowinreg' 'python-tqdm' 'python-colorama' 'python-pycryptodomex')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-pytest'
)
source=("https://github.com/skelsec/${_pkgname}/archive/refs/tags/${pkgver}.zip")
sha256sums=('b7b16a84c264de0e11e4a3f408b295e177518dc88cfc1b40779aa707b772ca6b')

build() {
  cd ${_pkgname}-${pkgver}
  # rm -rf tests # Don't build tests, because of conflicts with other packages
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  pytest
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
