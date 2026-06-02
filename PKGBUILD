# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xantares

pkgname=python-pytablewriter
_pkgname=pytablewriter
pkgver=1.2.1
pkgrel=2
pkgdesc='Write tables in various formats (Markdown, reStructuredText, CSV, JSON, Excel, HTML, LaTeX, ...)'
arch=('any')
url='https://github.com/thombashi/pytablewriter'
license=('MIT')
depends=(
    'python'
    'python-setuptools'
    'python-dataproperty'
    'python-mbstrdecoder'
    'python-pathvalidate'
    'python-tabledata'
    'python-tcolorpy'
    'python-typepy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'python-xlsxwriter: Excel (.xlsx) table output (excel extra)'
    'python-pandas: pandas DataFrame output (pandas extra)'
    'python-yaml: YAML table output (yaml extra)'
    'python-toml: TOML table output (toml extra)'
    'python-simplejson: faster JSON serialization'
    'python-loguru: logging support (logging extra)'
    'python-elasticsearch: Elasticsearch index output (es extra)'
    'python-dominate: HTML table output (html extra)'
    'python-pytablereader: read tables back in (from extra)'
)
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7bd0f4f397e070e3b8a34edcf1b9257ccbb18305493d8350a5dbc9957fced959')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import pytablewriter; print(pytablewriter.__version__)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
