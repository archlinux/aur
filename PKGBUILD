# Maintainer: Kevin Diu <kevindiujp@gmail.com>
pkgname=go-bin
pkgver=1.26.2
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
sha256sums_x86_64=('990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282')
sha256sums_aarch64=('c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23')
sha256sums_armv7h=('0000e45577827b0a8868588c543cbe4232853def1d3d7a344ad6e60ce2b015c8')

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
