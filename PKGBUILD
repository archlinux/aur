# Maintainer: darksoulxb <https://github.com/darksoulxb>

pkgname=rv-cli
pkgver=0.1.2
pkgrel=1
pkgdesc="A fast, no-bs command-line shortcut manager for the terminal"
arch=('any')
url="https://github.com/darksoulxb/rv-cli"
license=('MIT')
depends=(
    'python>=3.10'
    'python-typer'
    'python-platformdirs'
    'python-rich'
    'python-click'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'bash: bash shell support'
    'zsh: zsh shell support'
    'fish: fish shell support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/darksoulxb/rv-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2e28fbfff43062d6a3c6a15e3b6ce3061e19ca62bb5fd72a51040d71b338a96384a961c853ba959102980339dac897e9c9ce0e96ad459557ebbbc167826bdc86')

build() {
    cd "rv-cli-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "rv-cli-$pkgver"
    python -c "from rv_cli.main import app; print('import OK')"
}

package() {
    cd "rv-cli-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
