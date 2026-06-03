# Maintainer: daonm <https://github.com/the-daonm>
pkgname=gopac
pkgver=1.5.0
pkgrel=1
pkgdesc="A warm, beautiful TUI for Arch Linux package management"
arch=('x86_64' 'aarch64')
url="https://github.com/the-daonm/gopac"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('yay: AUR helper' 'paru: AUR helper')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('66460ba4ed6caf7ce7784975de577763b1d1361b3fa9998f9d7a1a6a3e31b502')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w -X main.version=v${pkgver}" -o gopac .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 completions/gopac.fish "$pkgdir/usr/share/fish/vendor_completions.d/gopac.fish"
}
