# Maintainer: Zack Fitch <zack@internetuniverse.org>
pkgname=python-pyghidra-lite
pkgver=0.1.1
pkgrel=1
pkgdesc="Token-efficient MCP server for Ghidra-based reverse engineering"
arch=('any')
url="https://github.com/johnzfitch/pyghidra-lite"
license=('MIT')
depends=(
    'python>=3.11'
    'python-mcp'
    'python-pyghidra'
    'python-pydantic'
    'python-click'
    'python-jpype1'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'python-capstone: emulation support'
    'python-unicorn: emulation support'
    'ghidra: required for binary analysis'
)
source=("https://files.pythonhosted.org/packages/source/p/pyghidra-lite/pyghidra_lite-${pkgver}.tar.gz")
sha256sums=('7b1ed447c81b96fa7fb9286c8eb6ccff78d0de59dabb7b39d4a831fa778ea1f8')

build() {
    cd "pyghidra_lite-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "pyghidra_lite-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
