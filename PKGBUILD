# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: http://qpm.io
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/Cutehacks/qpm

_pkgname=qpm
pkgname=${_pkgname}-git
pkgver=v0.10.0.r4.gc554ebe
pkgrel=1
pkgdesc='Qt Package Manager'
arch=('x86_64' 'i686')
url='http://qpm.io'
license=('LGPL')
provides=('qpm')
makedepends=('go' 'git')
source=("git://github.com/Cutehacks/qpm")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  git submodule init
  git submodule update

  export GOPATH=${PWD}
  export PATH=${GOPATH}/bin:${PATH}

  go build qpm.io/qpm
}

package() {
  cd "$_pkgname"
  
  local installdir=${pkgdir}/usr/bin
  
  mkdir -p ${installdir}
  cp qpm ${installdir}
}
