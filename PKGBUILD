# Maintainer: Evan Chen <evan@evanchen.cc>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: graysky <graysky AT archlinux DOR us>

pkgname=archey3
# https://github.com/lclarkmichalek/archey3/blob/master/PKGBUILD
pkgver=0.5
pkgrel=16
pkgdesc='Output a logo and various system information'
arch=(any)
url='https://lclarkmichalek.github.io/archey3/'
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools)
optdepends=('imagemagick: for default screenshot command'
  'python-logbook: alternative logging system')
source=('git+https://github.com/lclarkmichalek/archey3#commit=ac687529ec6208954f09c29f01760c66f73b1d10'
  'py312-syntax-warning.patch')
b2sums=('9591739ade5a56a933be041e419a3597a254a376d0e5b5d169d57f14473ddc5b7d408fcc12a5bf64c4a39876aa5b64745845c98b590f5a193513dec7c0408271'
  'd3a344ef172fec508178eed413f6ed0b50048cc66fe92dfdc0c41e00957c5f0b6f1cbf3d01f345c8ec5457fcd3abfc00f1793522031a534e04de3b8142e7ad49')

prepare() {
  cd $pkgname
  git apply $srcdir/py312-syntax-warning.patch
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
