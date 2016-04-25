# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: http://qpm.io
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/Cutehacks/qpm

pkgname=qpm
pkgver=v0.10.0
pkgrel=2
pkgdesc='Qt Package Manager'
arch=('x86_64' 'i686')
url='http://qpm.io'
license=('LGPL')
provides=('qpm')
makedepends=('go' 'git')
source=("git://github.com/Cutehacks/qpm#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  git submodule init
  git submodule update

  export GOPATH=${PWD}
  export PATH=${GOPATH}/bin:${PATH}

  go build qpm.io/qpm
}

package() {
  cd "$pkgname"

  local installdir=${pkgdir}/usr/bin

  mkdir -p ${installdir}
  cp qpm ${installdir}
}
