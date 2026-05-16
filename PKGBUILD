# Maintainer: daonm <https://github.com/the-daonm>
pkgname=gopac
pkgver=1.4.0
pkgrel=1
pkgdesc="A warm, beautiful TUI for Arch Linux package management"
arch=('x86_64' 'aarch64')
url="https://github.com/the-daonm/gopac"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('yay: AUR helper' 'paru: AUR helper')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dacd0411f8d2af6f5ec5075058df6b8f4c00b3f0ba5b35f548a9a50520d92de5')

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
