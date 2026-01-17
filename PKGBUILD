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
sha256sums=('e835ebf32992c401428e3361ea9610d8e84d40ca79cf7e9ea9ab953318f1e5b1')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-w -s" -o gopac .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}
