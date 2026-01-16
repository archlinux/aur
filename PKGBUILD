# Maintainer: Kevin Diu <kevindiujp@gmail.com>
pkgname=go-bin
pkgver=1.25.6
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
sha256sums_x86_64=('f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a')
sha256sums_aarch64=('738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5')
sha256sums_armv7h=('679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae')

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
