# Maintainer: Kevin Diu <kevindiujp@gmail.com>
pkgname=go-bin
pkgver=1.26.1
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
sha256sums_x86_64=('031f088e5d955bab8657ede27ad4e3bc5b7c1ba281f05f245bcc304f327c987a')
sha256sums_aarch64=('a290581cfe4fe28ddd737dde3095f3dbeb7f2e4065cab4eae44dfc53b760c2f7')
sha256sums_armv7h=('c9937198994dc173b87630a94a0d323442bef81bf7589b1170d55a8ebf759bda')

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
