# Maintainer: darksoulxb <https://github.com/darksoulxb>

pkgname=rv-cli
pkgver=0.1.6
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
b2sums=('05dd1223f079ecfbf39103fb3ac54d58900939c388678761fc61fed8d87f76ad8c78e608cc76424e6f5b674c91356e629705fe515a79b9c88fd6a8bae5205aeb')

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
