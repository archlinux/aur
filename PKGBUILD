# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=sift
pkgver=0.9.0
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
sha256sums=('bbbd5c472c36b78896cd7ae673749d3943621a6d5523d47973ed2fc6800ae4c8')
_gourl="github.com/svent/${pkgname}"

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go get -v ${_gourl}
}

# check() {
  # export GOPATH="${srcdir}"
  # go test -v -x github.com/svent/sift
# }

package() {
  install -Dm 775 "${srcdir}/bin/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
