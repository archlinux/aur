# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='krop'
pkgname="${_name}-git"
pkgver=r114.e96d42b
pkgrel=1
pkgdesc='Simple graphical tool to crop the pages of PDF files'
arch=('any')
url='https://github.com/arminstraub/krop'
license=('GPL3')
depends=(
  'python'
  'python-poppler-qt5' # AUR
  'python-pypdf2' # AUR
  'python-pyqt5'
  'python-pikepdf'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
provides=("${_name}")
conflicts=("${_name}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  # There are tags, but the last one dates back to 2020 so ignore them
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
