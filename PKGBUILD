# Maintainer: Miodrag Tokić
# Contributor: Yuanji <self@gimo.me>
# Contributor: Aaron Abbott <aabmass at gmail dot com>

pkgname=mycli
pkgver=2.13.1
pkgrel=1
pkgdesc='Rich terminal client for MySQL with autocompletion, syntax highlighting, and dataframes'
arch=('any')
url='https://github.com/dbcli/mycli'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-click'
    'python-clickdc'
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
    'python-jinja'
    'python-yaspin'
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
    'python-polars: dataframe support'
    'python-altair: dataframe support'
    'python-vl-convert: dataframe support'
)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbcli/mycli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('72b8da57ecab8898c1316bcedfebc320f8d5375058254d2d8c2fac172a10360a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
