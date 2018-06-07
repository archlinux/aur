# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=irdvo
_pkgname=gpxtools
_branch=master
pkgname=${_pkgname}-git
pkgver=r35.6f3ff01
pkgrel=1
pkgdesc='A collection of c++ tools for using GPX files'
arch=('i686' 'x86_64')
url="https://github.com/irdvo/gpxtools"
license=('GPL3')
makedepends=('git')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}-${_branch}::git://github.com/${_orgname}/${_pkgname}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}-${_branch}

  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "r%s" "${REVISION}"
}

build() {
  cd ${_pkgname}-${_branch}

  rm -rf build
  mkdir -p build
  cd build

  cmake ..
  make
}

package() {
  cd ${_pkgname}-${_branch}

  install -d 755 ${pkgdir}/usr/bin
  install -m 755 build/gpx* ${pkgdir}/usr/bin/
}
