# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=sift
pkgver=0.4.1
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('sift-bin')
replaces=('sift-bin')
provides=("sift=${pkgver}")
source=("https://github.com/svent/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('da9b34bddd0c1798ebef5fddedae65b08c99ff34527050a637a2039b251d71fa')

# Go URLs
_github_gourl='github.com/svent'
_golang_gourl='golang.org'

prepare() {
  export GOPATH="${srcdir}"
  go get -fix -v -x ${_github_gourl}/go-flags
  go get -fix -v -x ${_github_gourl}/go-nbreader
  go get -fix -v -x ${_golang_gourl}/x/crypto/ssh/terminal
}

build() {
  cd "${pkgname}-${pkgver}"

  GOPATH="${srcdir}" go build
}

check() {
  export GOPATH="${srcdir}"
  go test -v -x ${_github_gourl}/go-flags
  go test -v -x ${_github_gourl}/go-nbreader
  go test -v -x ${_golang_gourl}/x/crypto/ssh/terminal
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
