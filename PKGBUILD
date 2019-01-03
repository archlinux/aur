# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=irdvo
_pkgname=gpxtools
_branch=master
pkgname=${_pkgname}-git
pkgver=r37.5a75289
pkgrel=2
pkgdesc='A collection of c++ tools for using GPX files'
arch=('i686' 'x86_64')
url='https://github.com/irdvo/gpxtools'
license=('GPL3')
makedepends=('cmake' 'git')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}-${_branch}::git://github.com/${_orgname}/${_pkgname}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}-${_branch}

  count="$(git rev-list --count HEAD)"
  head="$(git rev-parse --short HEAD)"

  printf "r%s.%s" "${count}" "${head}"
}

build() {
  cd ${_pkgname}-${_branch}

  rm -rf build
  mkdir -p build
  cd build

  cmake ..
  cmake --build .
}

package() {
  cd ${_pkgname}-${_branch}

  install -Dm755 build/gpx* -t ${pkgdir}/usr/bin
}
