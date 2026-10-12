# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-unicrypto
_pkgname=unicrypto
pkgver=0.0.12
pkgrel=1
pkgdesc="Unified interface for cryptographic libraries."
url="https://github.com/skelsec/unicrypto"
arch=('any')
license=('MIT')
depends=('python' 'python-pycryptodomex')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("${pkgname}-${pkgver}::https://github.com/skelsec/${_pkgname}/archive/refs/tags/${pkgver}.zip") 
sha256sums=('a22ba531ab77d331b20cc94c549b95eda65a399e737766bf17185bd8092ea9d9')

build() {
  cd ${_pkgname}-${pkgver}
  rm -rf tests
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
