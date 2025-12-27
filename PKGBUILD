# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac
pkgver=1.2.1
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
sha256sums=('0b7bf30c94568fe9a1a106769f22f79558eda4a792973cfce2cd79909ae3e55b')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-w -s" -o gopac .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}
