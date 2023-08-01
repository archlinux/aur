# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.5.9
pkgrel=3
_name=pyzotero
pkgdesc="A Python wrapper for the Zotero API"
arch=('any')
url="https://github.com/urschrei/$_name"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('b0b5221dc66d69b8d7a13f2c7dc34fe656fd5c61c851e273a0a40fc755ff5fdd463bc2de6726c0ef302ab9f64d0f2589d687257601e582be9502142332e174ee')
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
