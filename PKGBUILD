# Maintainer: Ryan Hughes <ryan@ryanrhughes.com>
pkgname=hatchet
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI for managing work via Fizzy and Git worktrees with automatic database cloning for Rails projects"
arch=('x86_64' 'aarch64')
url="https://github.com/ryanrhughes/hatchet"
license=('MIT')
depends=()
makedepends=('bun-bin')
options=('!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryanrhughes/hatchet/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  bun install --frozen-lockfile
  bun build src/main.ts --compile --outfile dist/hatchet
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 dist/hatchet "$pkgdir/usr/bin/hatchet"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
