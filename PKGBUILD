# Maintainer: Aaron Blair <aaron@aaronpb.me>

pkgname=gobuster
pkgver=3.0.1
pkgrel=5
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
depends=()
makedepends=('go>=1.10' 'git')
optdepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OJ/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('9c70c73b4c08b02d1fc722cd82eda3d8ce683de53b08c8bddd31fc5c4d90a977')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  export GOPATH="${srcdir}/../"
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
