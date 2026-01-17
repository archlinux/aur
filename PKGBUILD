# Maintainer: mdao <https://github.com/mdao>
pkgname=gopac
pkgver=1.3.0
pkgrel=1
pkgdesc="A warm, beautiful TUI for Arch Linux package management"
arch=('x86_64' 'aarch64')
url="https://github.com/mdao/gopac"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('yay: AUR helper' 'paru: AUR helper')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1db028287af503aa80df8a49261b69768bba7335c0364f75e569e8b4e39b2a23')

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
