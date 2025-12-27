# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac
pkgver=1.2.2
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
sha256sums=('da2cd862f0b0732a7801191bb7ccfb1fa8753202a4ecfe77172d8fde5815f463')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-w -s" -o gopac .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}
