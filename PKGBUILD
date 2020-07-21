# Maintainer: Victor <v1c70rp at gmail dot com>

_pkgname=thrust
pkgname=thrust-git
pkgver=1.9.10.40.gd9d7b510
pkgrel=1
pkgdesc='A C++ parallel programming library which resembles the C++ Standard Library'
arch=('any')
url="https://github.com/thrust/${_pkgname}"
license=('Apache')

provides=('thrust')
conflicts=('thrust')
makedepends=('git')
depends=()
optdepends=(
  'cuda: for CUDA backend'
  'openmp: for OMP backend'
  'intel-tbb: for TBB backend'
)

source=("git+https://github.com/thrust/${_pkgname}.git"
        "git+https://github.com/thrust/cub.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed -e 's|-|.|g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git config submodule.cub.url "${srcdir}/cub"
  git submodule update
}

package() {
  install -dm 755 "${pkgdir}/opt/${_pkgname}"
  cd "${srcdir}/${_pkgname}"
  cp -r ${_pkgname} "${pkgdir}/opt/${_pkgname}/"
  cp -r examples "${pkgdir}/opt/${_pkgname}/"
  cp -rL cub "${pkgdir}/opt/${_pkgname}/"
}

# vim: ft=sh ts=2 sw=2 et
