# Maintainer: Hao Long <aur@esd.cc>

pkgname=terminal-to-html
pkgver=3.3.0
pkgrel=1
pkgdesc="Converts arbitrary shell output (with ANSI) into beautifully rendered HTML"
arch=("x86_64" "i686")
url="https://github.com/buildkite/terminal-to-html"
license=('MIT')
provides=('terminal-to-html')
conflicts=('terminal-to-html')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('b0a250e85e5c5f7b22e7eaea482db372de11d5398bcfee3defec490d47f01e22'
            'ad8a919cd390f9475ed22addad10d283539f5b9afec268b03427c667e60b9ae5')

build() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname-$pkgver/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
