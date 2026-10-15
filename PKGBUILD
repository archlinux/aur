# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>

pkgname=python-pyzotero
pkgver=1.16.0
pkgrel=1
pkgdesc="A Python wrapper for the Zotero API"
arch=(any)
url="https://github.com/urschrei/pyzotero"
license=(BlueOak-1.0.0)
depends=(
    python
    python-bibtexparser
    python-click
    #python-fastmcp
    python-feedparser
    python-httpx2
    #python-pytz
    #python-requests
    python-whenever-git
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
sha512sums=('1b6e5fc8da38cc9ae54a5fb1645e4ee2420fe14bdbc630113afb0cdf6a24bc4a4266da97cfba5e016ef4bf875e8396c964c2aed580ddba821ca78bcc344adb3c')

prepare() {
  cd "pyzotero-${pkgver}"
  sed -i 's/uv_build>=0.8.14,<0.12.0/uv_build>=0.13/g' pyproject.toml
}

build() {
  cd "pyzotero-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pyzotero-${pkgver}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
