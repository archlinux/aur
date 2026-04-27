# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Xyne <ca archlinux xyne, backwards>

pkgname=python-pyzotero-git
pkgver=1.11.1.r0.ga1aae6b
pkgrel=1
pkgdesc="A Python wrapper for the Zotero API"
arch=(any)
url="https://github.com/urschrei/pyzotero"
license=(BlueOak-1.0.0)
depends=(python python-feedparser python-bibtexparser ) #python-requests python-pytz
makedepends=(git python-build python-wheel python-installer python-setuptools-scm python-toml python-uv-build)
provides=(python-pyzotero)
conflicts=(python-pyzotero)
source=("python-pyzotero::git+https://github.com/urschrei/pyzotero.git"
        0001-remove-lock.patch)
sha512sums=('SKIP'
            'fcae7dc070900c8701a35fcbc4862d5f625b9867e225f3137163ca06538850ec5a5e7ca791b14c874b6a5728ba104efd7ac2f737dbf44ca21f299d2fe45ee7ba')

prepare() {
  cd "python-pyzotero"
  patch -Np1 -i ../0001-remove-lock.patch
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
