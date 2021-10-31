# Maintainer: SoMuchForSubtlety <s0muchfrsubtlety@gmail.com>
pkgname=f1viewer
pkgver=2.4.0
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
sha256sums=('51ff7cc2e32e6b5d0879d308d28cce0f001ab981b83d6e36b695ff7a9ac35e49')

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
