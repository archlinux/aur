# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Xyne <ca archlinux xyne, backwards>

pkgname=python-pyzotero-git
pkgver=1.16.0.r0.g5d9307d
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
    git
    python-build
    python-installer
    python-setuptools-scm
    python-toml
    python-uv-build
    python-wheel
    )
provides=(python-pyzotero)
conflicts=(python-pyzotero)
source=("python-pyzotero::git+https://github.com/urschrei/pyzotero.git")
sha512sums=('SKIP')

prepare() {
  cd "python-pyzotero"
  sed -i 's/uv_build>=0.8.14,<0.12.0/uv_build>=0.13/g' pyproject.toml
}

pkgver() {
  cd "python-pyzotero"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "python-pyzotero"
  python -m build --wheel --no-isolation
}

package() {
  cd "python-pyzotero"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
