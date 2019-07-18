# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=rekols
_pkgname=redict
_branch=master
pkgname=${_pkgname}-git
pkgver=r139.525aac0
pkgrel=1
pkgdesc='A dictionary for Linux, based on C++/Qt development'
arch=(x86_64)
url='https://github.com/rekols/redict'
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg')
makedepends=('git' 'qt5-tools')
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

  qmake CONFIG+=release PREFIX=/usr
  make
}

package() {
  cd ${_pkgname}-${_branch}

  make INSTALL_ROOT="${pkgdir}" install
}
