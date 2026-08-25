# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=certora-cli
_name=certora_cli
pkgver=8.19.0
pkgrel=1
pkgdesc="Runner for the Certora Prover: formal verification of EVM, Solana and Stellar smart contracts"
arch=('any')
url="https://www.certora.com"
license=('GPL-3.0-only')
depends=('java-runtime>=19'
         'python'
         'python-click'
         'python-jinja'
         'python-json5'
         'python-pycryptodome'
         'python-requests'
         'python-rich'
         'python-sly'
         'python-strenum'
         'python-tabulate'
         'python-tqdm'
         'python-typing_extensions'
         'python-wcmatch')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('certora-prover-bin: run verification locally instead of on Certora'"'"'s cloud'
            'certora-gambit-bin: mutant generation for certoraMutate'
            'solidity: solc compiler for building Solidity contracts'
            'graphviz: TAC reports')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('df4e337b3e40f7d914dcf9dfa43f0a13e0123c466fba3e60d1a7afb8fea07dc6')

latestver() {
    curl -fsSL https://pypi.org/pypi/${pkgname}/json | jq -r '.info.version'
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
