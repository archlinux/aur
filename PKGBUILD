# Maintainer: darksoulxb <https://github.com/darksoulxb>

pkgname=rv-cli
pkgver=0.1.5
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
b2sums=('52ac846316969597e01b863782112c0b2e25c0b54287cb24116859b5f84b014268c7d650114fa4b3625165a81c3f719fae36750a2bb31c66a3150bae757cc172')

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
