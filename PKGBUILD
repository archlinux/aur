# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac
pkgver=1.1.0
pkgrel=1
pkgdesc="A warm Gruvbox TUI for pacman and AUR"
arch=('x86_64')
url="https://github.com/the-daonm/gopac"
license=('MIT')
depends=('pacman')
makedepends=('go')
provides=('gopac')
conflicts=('gopac-git' 'gopac-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-w -s" -o gopac .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
  # Optional: Install README/License if they exist in source
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
