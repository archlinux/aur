# Maintainer: SoMuchForSubtlety <s0muchfrsubtlety@gmail.com>
pkgname=f1viewer
pkgver=2.0.1
pkgrel=1
pkgdesc="TUI client for F1TV"
arch=('x86_64')
url="https://github.com/SoMuchForSubtlety/f1viewer"
license=('GPL3')
optdepends=('mpv: play videos using mpv'
            'xclip: copying URLs to clipboard'
            'gnome-keyring: secret store backend'
            'kwallet: secret store backend')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoMuchForSubtlety/f1viewer/archive/v${pkgver}.tar.gz")
sha256sums=('0df83a5f657107559586217ea71c460c97dc730785cc14fd8ebf0e75cd1914a9')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -ldflags="-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" \
    -o $pkgname ./cmd/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
