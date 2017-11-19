# Maintainer: Christian Schuetz <cmschuetz12 at gmail dat com>

pkgname=btops-git
_pkgname=btops
pkgver=0.1.0.r0.g7ecfa08
pkgrel=1
pkgdesc="bspwm desktop management"
arch=('x86_64' 'i686')
url="https://github.com/cmschuetz/btops"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("btops")
source=("git+https://github.com/cmschuetz/btops.git")
sha256sums=('SKIP')
_gourl='github.com/cmschuetz/btops'

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rf "${srcdir}/src"
  mkdir -p "${srcdir}/src/github.com/cmschuetz"
  ln -sf "${srcdir}/${_pkgname}" "${srcdir}/src/github.com/cmschuetz/btops"
}

build() {
  export GOPATH="$srcdir"
  go get ${_gourl}
}

package() {
  cd "${_pkgname}"
  install -Dm755 "../bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
