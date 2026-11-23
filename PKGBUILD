# Maintainer: KiWi42 <pullthisplug dash aur at yahoo dot com>
# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-aesedb
_pkgname=aesedb
pkgver=0.1.8
pkgrel=1
pkgdesc="Asynchronous parser for JET."
url="https://github.com/skelsec/aesedb"
arch=('any')
license=('MIT')
depends=('python' 'python-unicrypto>=0.0.12' 'python-aiowinreg>=0.0.13' 'python-tqdm' 'python-colorama' 'python-pycryptodomex')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-pytest'
  'python-pytest-asyncio'
)
source=("https://github.com/skelsec/${_pkgname}/archive/refs/tags/${pkgver}.zip")
sha256sums=('617c4dfbc63f133f643c01584a0230c9bb089f2f1ddc1019951488e6b58a74e4')

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
