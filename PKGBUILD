# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: http://qpm.io
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/Cutehacks/qpm

pkgname=qpm
pkgver=0.1
pkgrel=1
pkgdesc='Qt Package Manager'
arch=('x86_64' 'i686')
url='http://qpm.io'
license=('LGPL')
depends=('go')
makedepends=('git')
source=("git://github.com/Cutehacks/qpm#branch=master")
sha256sums=('SKIP')
_reponame="qpm"

build() {
  local _rootdir="${srcdir}/${_reponame}"
  cd "${_rootdir}"
  git submodule init
  git submodule update

  export GOPATH=${_rootdir}
  export PATH=${GOPATH}/bin:${PATH}
  go build qpm.io/qpm
}

package() {
  local installdir=${pkgdir}/usr/bin
  local _rootdir="${srcdir}/${_reponame}"
  mkdir -p ${installdir}
  cp ${_rootdir}/qpm ${installdir}
}
