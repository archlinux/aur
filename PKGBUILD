# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Xyne <ca archlinux xyne, backwards>

pkgname=python-pyzotero-git
pkgver=1.13.2.r2.g93cedbb
pkgrel=2
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
