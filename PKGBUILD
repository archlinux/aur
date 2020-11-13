# Maintainer: SoMuchForSubtlety <s0muchfrsubtlety@gmail.com>
pkgname=f1viewer
pkgver=1.4.0
pkgrel=1
pkgdesc="TUI client for F1TV"
arch=('x86_64')
url="https://github.com/SoMuchForSubtlety/f1viewer"
license=('GPL3')
optdepends=('mpv: play videos using mpv'
            'xclip: copying URLs to clipboard'
            'keepassxc: secret store backend'
            'pass: secret store backend'
            'gnome-keyring: secret store backend'
            'kwallet: secret store backend')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoMuchForSubtlety/f1viewer/archive/v${pkgver}.tar.gz")
sha256sums=('9869815e95f8f917baf911fe0e6f99bb24be34be5ded07fcdefc7d189498dbcc')

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -ldflags="-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
