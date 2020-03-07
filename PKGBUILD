# Maintainer: SoMuchForSubtlety <s0muchfrsubtlety@gmail.com>
pkgname=f1viewer
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI client for F1TV"
arch=('x86_64')
url="https://github.com/SoMuchForSubtlety/f1viewer"
license=('GPL3')
depends=('mpv' 'libsecret')
optdepends=('xclip: copying URLs to clipboard')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoMuchForSubtlety/f1viewer/archive/v${pkgver}.tar.gz")
sha256sums=('40986b7ed358adf2299882318d9ca81ef7f1bf730ed30b3c5da362518987d6af')

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