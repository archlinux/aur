# Maintainer: Ryan Hughes <ryan@ryanrhughes.com>
pkgname=hatchet
pkgver=1.0.1
pkgrel=1
pkgdesc="A TUI for managing work via Fizzy and Git worktrees with automatic database cloning for Rails projects"
arch=('x86_64' 'aarch64')
url="https://github.com/ryanrhughes/hatchet"
license=('MIT')
depends=('fizzy-cli')
makedepends=('bun-bin')
options=('!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryanrhughes/hatchet/archive/v$pkgver.tar.gz")
sha256sums=('d8bed5f6bbbe1bf440bf61e90ca7db16784022c931d7b3713c4eaed1d4b027e8')

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
