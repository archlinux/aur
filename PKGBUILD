# Maintainer: Samuel Walladge <aur at swalladge dot net>

pkgname=peco
pkgver=0.5.7
pkgrel=2
pkgdesc='Simplistic interactive filtering tool'
arch=('i686' 'x86_64')
url='https://github.com/peco/peco'
license=('MIT')
makedepends=('go' 'wget')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9bf4f10b3587270834380e1ea939625bd47eaa166bfabd050e66fad3ffd8f9b0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
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
