# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=sift
pkgver=0.3.4
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('sift-bin')
replaces=('sift-bin')
source=("https://github.com/svent/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('88eefbfd02bea5183cedfaab9bfeef397c622a15970b0540ddb4a3e3ea62d775')
_gourl='github.com/svent'

prepare() {
  export GOPATH="${srcdir}"
  go get -fix -v -x ${_gourl}/go-flags
  go get -fix -v -x ${_gourl}/go-nbreader
}

build() {
  cd "${pkgname}-${pkgver}"

  GOPATH="${srcdir}" go build
}

check() {
  export GOPATH="${srcdir}"
  go test -v -x ${_gourl}/go-flags
  go test -v -x ${_gourl}/go-nbreader
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
