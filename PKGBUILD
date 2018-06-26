# Maintainer: Aaron Blair <aaron@aaronpb.me>

pkgname=subfinder
pkgver=1.0
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites."
arch=('x86_64')
url="https://github.com/subfinder/subfinder"
license=('MIT')
depends=()
makedepends=('go>=1.10' 'git')
optdepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/subfinder/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('74a4dda65c695d35b5d146862a6c2de444819932dca4e4a39b87f028b0a79af4')

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
