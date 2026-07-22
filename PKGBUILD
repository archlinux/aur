# Maintainer: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>

pkgname=slither
pkgver=0.11.5
pkgrel=1
pkgdesc='A static analysis framework for Solidity'
arch=(any)
url="https://github.com/crytic/slither"
license=('AGPL-3.0-only')
depends=(
  'python>=3.10'
  python-crytic-compile
  python-eth-abi
  python-eth-typing
  python-eth-utils
  python-packaging
  python-prettytable
  python-pycryptodome
  python-web3
)
optdepends=(
  'python-fasttext: slither-simil model training'
  'python-matplotlib: slither-simil plotting'
  'python-numpy: slither-simil analysis'
  'python-openai: OpenAI Codex integration'
  'python-scikit-learn: slither-simil plotting'
)
makedepends=(python-build python-hatchling python-installer)
_name=slither_analyzer
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/s/slither-analyzer/${_name}-${pkgver}.tar.gz")
sha256sums=('d90af76b86bdf7ced56fc4c8eea8792cde1ec2c375372d5e70298c2ff998d5e1')

latestver() {
  curl -fsSL 'https://pypi.org/pypi/slither-analyzer/json' |
    python -c 'import json, sys; print(json.load(sys.stdin)["info"]["version"])'
}

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
