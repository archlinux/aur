# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.5.18
pkgrel=1
_name=pyzotero
pkgdesc="A Python wrapper for the Zotero API"
arch=('any')
url="https://github.com/urschrei/$_name"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('c45e18de0ed479b0ce03cc69ec7a2b060370d6c26e57fa707d2230078e87cdb9eb70f341bac8533a9fa6f4101f29aeca8767befa1e275c0dbd7e778e9c227c21')
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
