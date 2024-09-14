# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.5.25
pkgrel=1
_name=pyzotero
pkgdesc="A Python wrapper for the Zotero API"
arch=('any')
url="https://github.com/urschrei/$_name"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('7a5e897d54a2b9a87155a0dc47aa4414a746184deae6931ee3d277c5913fe813c87bf2c658b2567cfe526aac98e0d9d8e964c4a9de507f5be4becda539aacecd')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm' 'python-toml')
depends=('python-requests' 'python-feedparser' 'python-bibtexparser' 'python-pytz')

prepare() {
  cd "$_name-$pkgver"
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
