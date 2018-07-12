# Maintainer: Aaron Blair <aaron@aaronpb.me>

pkgname=gobuster
pkgver=1.4.2
pkgrel=2
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
depends=()
makedepends=('go>=1.10' 'git')
optdepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OJ/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('e90990f45f06324eb2378369b795a526a6145ca12c8a631493505f1ecfada74f')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  export GOPATH="${srcdir}"
  export PATH="${PATH}:${srcdir}/bin"
  install -d "${GOPATH}/src/github.com/OJ"
  cp -a "$(pwd)" "${GOPATH}/src/github.com/OJ/gobuster"
  go get -d
}

build() {
  cd "${GOPATH}/src/github.com/OJ/gobuster"
  go build
}

package() {
  cd "${GOPATH}/src/github.com/OJ/gobuster"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
