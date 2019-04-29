# Maintainer: Aaron Blair <aaron@aaronpb.me>

pkgname=subfinder
pkgver=1.2
pkgrel=2
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites."
arch=('x86_64')
url="https://github.com/subfinder/subfinder"
license=('MIT')
depends=()
makedepends=('go>=1.10' 'git')
optdepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/subfinder/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('2b8a09506466baa04c10404d38e0da6a2066a79e8b5c69a720d939804375ba2c')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  export GOPATH="${srcdir}"
  export PATH="${PATH}:${srcdir}/bin"
  install -d "${GOPATH}/src/github.com/subfinder"
  cp -a "$(pwd)" "${GOPATH}/src/github.com/subfinder/subfinder"
  go get -d
}

build() {
  cd "${GOPATH}/src/github.com/subfinder/subfinder"
  go build
}

package() {
  cd "${GOPATH}/src/github.com/subfinder/subfinder"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
