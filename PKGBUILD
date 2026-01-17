# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac
pkgver=1.3.0
pkgrel=1
pkgdesc="A warm Gruvbox TUI for pacman and AUR"
arch=('x86_64')
options=('!debug')
url="https://github.com/the-daonm/gopac"
license=('MIT')
depends=('pacman')
makedepends=('go')
provides=('gopac')
conflicts=('gopac-git' 'gopac-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06d2fff230d081cca32e6ebe8f419f5a841fd6d433d74cfc37425ee2343ca7e5')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -ldflags "-X main.version=${pkgver}" -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-w -s" -o gopac .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
  install -Dm644 completions/gopac.fish "$pkgdir/usr/share/fish/vendor_completions.d/gopac.fish"
}
