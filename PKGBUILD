# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Daniel Vrátil <me@dvratil.cz>

_name=aqtinstall
pkgname=python-aqtinstall
pkgver=3.3.0
pkgrel=1
pkgdesc='aqt: Another (unofficial) Qt CLI Installer on multi-platforms'
arch=(any)
url='https://github.com/miurahr/aqtinstall'
license=('MIT')
depends=(
    python-beautifulsoup4
    python-defusedxml
    python-humanize
    python-patch-ng
    python-py7zr
    python-requests
    python-semantic-version
    python-texttable
)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
checkdepends=(twine)
source=("https://pypi.io/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9c7d85fbe7258be2d7d23fda33f8aff2e8b7536817255eaeaaf4226da8546a31')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    python -m twine check dist/*
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
