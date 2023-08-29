# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.5.10
pkgrel=1
_name=pyzotero
pkgdesc="A Python wrapper for the Zotero API"
arch=('any')
url="https://github.com/urschrei/$_name"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('437935696fb5f9cff083d609a23c847c345e6d37079afa9993cf1fb3dd0bd562ec10aa3b3344c8ae2075b4920bbbe2ce06ca05610e38c2f98bbb62ac64f9b9a2')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm' 'python-toml')
depends=('python-requests' 'python-feedparser' 'python-bibtexparser' 'python-pytz')

prepare() {
  cd "$_name-$pkgver"
  sed -i 's/4, <6/4/' pyproject.toml
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    install -D -m644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
