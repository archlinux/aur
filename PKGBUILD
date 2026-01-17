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
sha256sums=('ff39f63d356b94a48e2195bd8d76b8a0855c1bd11a1a859cb3ed7453f09f0ba9')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-w -s" -o gopac .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}
