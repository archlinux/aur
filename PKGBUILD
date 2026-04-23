# Maintainer: Mingxun Hua <huamingxun@gmail.com>
# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=python-pyosmocom-git
_name=pyosmocom
pkgver=0.0.12.r4.g75785e4
pkgrel=1
pkgdesc='Python implementation of core Osmocom utilities and protocols'
arch=('any')
url='https://osmocom.org/projects/pyosmocom/wiki'
license=('GPL-2.0-or-later')
depends=(
  'python'
  'python-construct'
  'python-gsm0338'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://gitea.osmocom.org/osmocom/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^\(v\)\1*//'
}

build() {
  cd "${srcdir}/${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
