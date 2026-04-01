# Maintainer: Miodrag Tokić
# Contributor: Yuanji <self@gimo.me>
# Contributor: Aaron Abbott <aabmass at gmail dot com>

pkgname=mycli
pkgver=1.65.0
pkgrel=1
pkgdesc='A Terminal Client for MySQL with AutoCompletion and Syntax Highlighting'
arch=('any')
url='https://github.com/dbcli/mycli'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-click'
    'python-cryptography'
    'python-pygments'
    'python-prompt_toolkit'
    'python-pymysql'
    'python-sqlparse'
    'python-sqlglot'
    'python-configobj'
    'python-cli_helpers'
    'python-wcwidth'
    'python-pyperclip'
    'python-pycryptodomex'
    'python-pyfzf'
    'python-rapidfuzz'
    'python-keyring'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
optdepends=(
    'python-llm: LLM support'
    'python-sshtunnel: SSH support'
)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbcli/mycli/archive/v${pkgver}.tar.gz")
sha256sums=('b0dfe7385ff5ea39f7b618fef6dcd247910e8ac4944085a3d8273c2a21668f70')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
