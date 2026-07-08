# Maintainer: Kevin Diu <kevindiujp@gmail.com>
pkgname=go-bin
pkgver=1.26.5
pkgrel=1
pkgdesc='Go programming language (binary release)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://go.dev/'
license=('BSD')
depends=('glibc')
provides=('go')
conflicts=('go')
options=('!strip' 'staticlibs')
source_x86_64=("https://go.dev/dl/go${pkgver}.linux-amd64.tar.gz")
source_aarch64=("https://go.dev/dl/go${pkgver}.linux-arm64.tar.gz")
source_armv7h=("https://go.dev/dl/go${pkgver}.linux-armv6l.tar.gz")
sha256sums_x86_64=('5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053')
sha256sums_aarch64=('fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49')
sha256sums_armv7h=('6dae9edab81c13bccf962dec15f1fd2ec26c14a6821b4d2c92dab4130c289d7a')

package() {
  install -dm755 "${pkgdir}/usr/lib"
  cp -a go "${pkgdir}/usr/lib/go"

  install -dm755 "${pkgdir}/usr/bin"
  for tool in go gofmt; do
    ln -s "../lib/go/bin/${tool}" "${pkgdir}/usr/bin/${tool}"
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 go/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
