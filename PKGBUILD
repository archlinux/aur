# Maintainer: Pavel Sibal <entexsoft@gmail.com>

_pkgname=ttkthemes
pkgname=python-ttkthemes-git
pkgver=3.3.0.0.g85c4b53
pkgrel=1
pkgdesc="Group of themes for the ttk extensions for Tkinter (git version)"
arch=('any')
url="https://github.com/TkinterEP/ttkthemes"
license=('GPL3')
depends=(
  'python'
  'python-pillow'
  'tk'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
provides=('python-ttkthemes')
conflicts=('python-ttkthemes')

source=("git+https://github.com/TkinterEP/ttkthemes.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # verze v podobě: 3.3.0.rXX.gHASH
  git describe --tags --long 2>/dev/null | sed 's/^v//; s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

