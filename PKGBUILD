# Maintainer: Kevin Diu <kevindiujp@gmail.com>
pkgname=go-bin
pkgver=1.27.2
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
sha256sums_x86_64=('ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5')
sha256sums_aarch64=('94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8')
sha256sums_armv7h=('e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95')

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
