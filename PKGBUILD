# Contributor: SZanko  <szanko at protonmail dot com>

pkgname=python-dictdiffer
pkgver=0.10.0
pkgrel=1
pkgdesc="Module that helps you to diff and patch dictionaries"
arch=('any')
url="https://github.com/inveniosoftware/dictdiffer"
license=('MIT')
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-pytest-runner
  python-wheel
  python-hatchling
  python-hatch-vcs
)
checkdepends=(
  python-pytest
  python-numpy
)
optdepends=(
  'python-numpy: for comparing numpy arrays'
)
source=("git+${url}#tag=v${pkgver}"
	pull-179.patch)
sha256sums=('874299d1387b86bdccd70a25f2832937fcc851ad4410b558ca81ea4d163cd3f8'
            'e746d0900944b49e4995540667b48476d8f02755a6c95befda4f894d2e97ad44')

prepare() {
  cd dictdiffer
  patch -p1 < ../pull-179.patch
}

build() {
  cd dictdiffer
  python -m build --wheel --no-isolation
}

check() {
  cd dictdiffer
  PYTHONPATH=. pytest -o addopts=""
}

package() {
  cd dictdiffer
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
