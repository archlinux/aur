# Maintainer: SoMuchForSubtlety <s0muchfrsubtlety@gmail.com>
pkgname=f1viewer
pkgver=2.7.0
pkgrel=1
pkgdesc="TUI client for F1TV"
arch=('any')
url="https://github.com/SoMuchForSubtlety/f1viewer"
license=('GPL3')
optdepends=('mpv: play videos using mpv'
            'xclip: copying URLs to clipboard'
            'gnome-keyring: secret store backend'
            'kwallet: secret store backend')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoMuchForSubtlety/f1viewer/archive/v${pkgver}.tar.gz")
sha256sums=('a5bbe1f1e830ac7ce281a2559daeb48359cc2568cdafb6e7c3e10262dc2e6088')

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
