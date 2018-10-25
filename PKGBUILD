# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=2.8.0
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('x86_64')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/${pkgver}.tar.gz)
sha512sums=('c62abe61f21e3fd6506042e3774a960716de677be0f9f2e57c61c8c0075cb4bff8535948f1795dfedab5a4c0d6a229a20f8a17aca579bbf1471639e12ab58a3f')


prepare() {
  mkdir -p "gopath/src/github.com/OWASP"
  ln -rTsf "Amass-${pkgver}" "gopath/src/github.com/OWASP/Amass"

  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"
  go get -d ./...
}

check() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"

  go test ./...

}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"

  go install -v ./...
}

package() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/bin"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}.netdomains" "${pkgdir}/usr/bin/${pkgname}.netdomains"
  install -Dm755 "${pkgname}.viz" "${pkgdir}/usr/bin/${pkgname}.viz"
  install -Dm755 "${pkgname}.db" "${pkgdir}/usr/bin/${pkgname}.db"
}
