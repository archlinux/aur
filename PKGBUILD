# Maintainer: architekton <al512@protonmail.com>

pkgname=amass
pkgver=2.6.0
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('x86_64')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('a0f9b1d658a4e804de09628c377a8ad583da019985f1cba6522a8a8313734f77dfb813ae73bb850706dd4cdf669678a32a00c17320e0cb748b58f81ca03f678d')


prepare() {
  mkdir -p "gopath/src/github.com/OWASP"
  ln -rTsf "Amass-${pkgver}" "gopath/src/github.com/OWASP/Amass"

  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"
  go get -d ./...
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"

  go install -v ./...
}

check() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"

  go test ./...
}

package() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/bin"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
