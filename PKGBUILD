# Maintainer: Brian "Beej Jorgensen" Hall <beej@beej.us>
# Contributor: Nikolay Korotkiy <sikmir@gmail.com>

_orgname=irdvo
_pkgname=gpxtools
_branch=master
pkgname=${_pkgname}-git
pkgver=r58.3a3276e
pkgrel=1
pkgdesc='A collection of command line tools for using GPX files'
arch=(x86_64)
url='https://notabug.org/irdvo/gpxtools'
license=('GPL3')
depends=('exiv2')
makedepends=('cmake' 'git')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}-${_branch}::git+https://notabug.org/${_orgname}/${_pkgname}.git#branch=${_branch}")
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
