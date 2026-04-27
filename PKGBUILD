# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>

pkgname=python-pyzotero
pkgver=1.11.1
pkgrel=1
pkgdesc="A Python wrapper for the Zotero API"
arch=(any)
url="https://github.com/urschrei/pyzotero"
license=(BlueOak-1.0.0)
depends=(python python-requests python-feedparser python-bibtexparser python-pytz)
makedepends=(python-build python-wheel python-installer python-setuptools-scm python-toml python-uv-build)
source=("https://github.com/urschrei/pyzotero/releases/download/v${pkgver}/pyzotero-${pkgver}.tar.gz"
        0001-remove-lock.patch)
sha512sums=('938c0c0b1e32bce80d6629a1a56f4a5024713cccf48307192b18faba7f4966d0ba3a58f49e92f97e3a51a2b231bf7006feef7f2b5ed928a2149b21164a8a8750'
            'fcae7dc070900c8701a35fcbc4862d5f625b9867e225f3137163ca06538850ec5a5e7ca791b14c874b6a5728ba104efd7ac2f737dbf44ca21f299d2fe45ee7ba')

prepare() {
  cd "pyzotero-${pkgver}"
  patch -Np1 -i ../0001-remove-lock.patch
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
