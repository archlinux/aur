# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>

_pkgname=python-mtga-helper
pkgname=${_pkgname}-git
pkgver=0.2.1.90.189cba2
pkgrel=1
pkgdesc='CLI application to parse log files from MTGA and analyse them using 17lands data'
arch=('any')
url='https://github.com/lubosz/python-mtga-helper'
license=('MIT')
depends=(python
         python-xdg-base-dirs
         python-scipy
         python-requests
         python-numpy
         python-tabulate
         python-coloredlogs
         "python-termcolor>=3.1.0")
makedepends=(python-build
             python-installer
             python-wheel)
source=("git+https://github.com/lubosz/python-mtga-helper.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  ver=$(python -c "from mtga_helper.__about__ import __version__; print(__version__)")
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $ver.$revision.$hash
}

build() {
  cd "${_pkgname}"
  rm dist -Rf
  python -m build --wheel --no-isolation
}

package(){
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
