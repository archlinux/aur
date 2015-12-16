# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: http://qpm.io
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/Cutehacks/qpm

_pkgver=0.10.0
pkgname=qpm
pkgver=v${_pkgver}
pkgrel=1
pkgdesc='Qt Package Manager'
arch=('x86_64' 'i686')
url='http://qpm.io'
provides=('qpm')
conflicts=('qpm-git')
license=('LGPL')
makedepends=('go')
source=("https://github.com/Cutehacks/qpm/archive/${pkgver}.tar.gz")
sha256sums=('2c56aa81e46fb144ff25b14a26476862462510e38cf1265b24c38e3ac4636ee5')
_srcdirname=${pkgname}-${_pkgver}

build() {
  cd "${_srcdirname}"

  export GOPATH=${PWD}
  export PATH=${GOPATH}/bin:${PATH}

  go build qpm.io/qpm
}

package() {
  cd "${_srcdirname}"

  local installdir=${pkgdir}/usr/bin

  mkdir -p ${installdir}
  cp qpm ${installdir}
}
