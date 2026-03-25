# Maintainer: darksoulxb <https://github.com/darksoulxb>

pkgname=rv-cli
pkgver=0.1.0
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
b2sums=('e7f81f094c944dd0db89971ac662bc944aabdd826753ae8bfbe53b998ff9194894208c99a3a93a54a8fcc0262f4ec820ca2c612a8f38a22b4297543147a9ae79')

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
