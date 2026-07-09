# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>

pkgname=python-pyzotero
pkgver=1.13.2
pkgrel=1
pkgdesc="A Python wrapper for the Zotero API"
arch=(any)
url="https://github.com/urschrei/pyzotero"
license=(BlueOak-1.0.0)
depends=(
    python
    python-bibtexparser
    python-click
    python-fastmcp
    python-feedparser
    python-httpx
    #python-pytz
    #python-requests
    python-whenever
    )
makedepends=(
    python-build
    python-installer
    python-setuptools-scm
    python-toml
    python-uv-build
    python-wheel
    )
source=("https://github.com/urschrei/pyzotero/releases/download/v${pkgver}/pyzotero-${pkgver}.tar.gz")
sha512sums=('46611670b1a75c20edbae542fbf01eb4996b80b387ad7a8d516d35c49ba344aaba16ff35916a31ac62e43e1779b42f153b9e3a46cbbf03490a31514b422238f4')

build() {
  cd "pyzotero-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pyzotero-${pkgver}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
