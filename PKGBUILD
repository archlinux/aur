# Maintainer: Miodrag Tokić

pkgname=python-sqlglot
pkgver=30.2.0
pkgrel=1
pkgdesc='An easily customizable SQL parser and transpiler'
arch=('any')
url='https://github.com/tobymao/sqlglot'
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobymao/sqlglot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38d8a15468b570bd4280e01add131bb72756bfb8a1afae9c4ecf8327b7c55ef8')

build() {
    cd "$srcdir/sqlglot-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/sqlglot-${pkgver}"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
