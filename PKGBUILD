# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-pytablereader
_pkgname=pytablereader
pkgver=0.31.4
pkgrel=2
pkgdesc='Load structured table data from files/strings/URLs (CSV, TSV, Excel, HTML, JSON, Markdown, MediaWiki, SQLite, ...)'
arch=('any')
url='https://github.com/thombashi/pytablereader'
license=('MIT')
depends=(
    'python'
    'python-setuptools'
    'python-beautifulsoup4'
    'python-dataproperty'
    'python-jsonschema'
    'python-mbstrdecoder'
    'python-path'
    'python-pathvalidate'
    'python-tabledata'
    'python-typepy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'python-markdown: read Markdown tables (md extra)'
    'python-pypandoc: read MediaWiki tables (mediawiki extra)'
    'python-loguru: logging support (logging extra)'
    'python-oauth2client: Google Sheets auth (gs extra)'
    'python-gspread: read Google Sheets (gs extra)'
    'python-simplesqlite: SQLite table I/O (sqlite extra)'
    'python-retryrequests: robust remote-URL loading (url extra)'
)
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ad97308308525cafe0eaa4b6a80a02499e0b4c6c979efb17452d302ad78bd5b1')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import pytablereader; print(pytablereader.__version__)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
