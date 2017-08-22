# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='powerline-go-git'
_pkgname='powerline-go'
pkgver=1.1.0.0.g939ac95
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('git' 'go')
provides=('powerline-go')
source=($_pkgname::'git+https://github.com/justjanne/powerline-go.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p "${GOPATH}/src"

  if [[ ! -e "${GOPATH}/src/${_pkgname}" ]]; then
    ln -s "${srcdir}/${_pkgname}" "${GOPATH}/src/${_pkgname}"
  fi
}

build() {
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/${_pkgname}"
  go get
  go build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -m755 -D powerline-go "${pkgdir}/usr/bin/powerline-go"
}

# vim:set ts=2 sw=2 et:
