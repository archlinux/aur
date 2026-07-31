# Maintainer: aziis98 <antonio.delucreziis@gmail.com>

pkgname=pdfatlas-git
_pkgname=pdfatlas
pkgver=r101.3fa6281
pkgrel=1
pkgdesc="PDF Reader with Search Portals and Auto-Crop"
arch=('any')
url="https://github.com/aziis98/pdfatlas"
license=('AGPL-3.0-only')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-pymupdf'
  'python-pillow'
  'python-opengl'
  'python-rapidfuzz'
  'python-tqdm'
  'python-numpy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/aziis98/pdfatlas.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 assets/com.aziis98.pdfatlas.desktop "$pkgdir/usr/share/applications/com.aziis98.pdfatlas.desktop"
  install -Dm644 assets/logo.png "$pkgdir/usr/share/pixmaps/com-aziis98-pdfatlas.png"
}

