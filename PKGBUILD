# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.5.15
pkgrel=1
_name=pyzotero
pkgdesc="A Python wrapper for the Zotero API"
arch=('any')
url="https://github.com/urschrei/$_name"
license=('MIT')
#~source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('0061e08983aaef115a88e181093b5e7bca521f5a627dfbfc7ccdf56ff7d606aca2c1d70001dc3c93cc621b621d1909f9d0f6acb25a65b04e0bf9764ed969de8b')
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
