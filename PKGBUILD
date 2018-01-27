# Maintainer: Dmitri Goutnik <dg@syrec.org>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gox
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple, no-frills tool for Go cross compilation"
arch=('i686' 'x86_64')
url="https://github.com/mitchellh/${pkgname}"
license=('MPL2')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2df7439e9901877685ff4e6377de863c3c2ec4cde43d0ca631ff65d1b64774ad')

prepare() {
  mkdir -p "${srcdir}/src/github.com/mitchellh"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/mitchellh/${pkgname}"
  env GOPATH="${srcdir}" go get github.com/mitchellh/iochan
}

build() {
  cd "${srcdir}/src/github.com/mitchellh/${pkgname}"
  env GOPATH="${srcdir}" go build
}

# check() {
#   cd "${srcdir}/src/github.com/mitchellh/${pkgname}"
#   env GOPATH="${srcdir}" go test
# }

package() {
  cd "${srcdir}/src/github.com/mitchellh/${pkgname}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
