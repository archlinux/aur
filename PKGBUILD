# Maintainer: Samuel Walladge <aur at swalladge dot net>

pkgname=peco
pkgver=0.5.8
pkgrel=3
pkgdesc='Simplistic interactive filtering tool'
arch=('i686' 'x86_64')
url='https://github.com/peco/peco'
license=('MIT')
makedepends=('go' 'wget')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('90d87503265c12f8583f5c6bc19c83eba7a2e15219a6339d5041628aa48c4705')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin" GO111MODULE=on
  mkdir -p out
  go mod download
  go build -o "out/${pkgname}" "cmd/${pkgname}/${pkgname}.go"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm755 "out/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/peco/LICENSE"
}

# vim:set ts=2 sw=2 et:
