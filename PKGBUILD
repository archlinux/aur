# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=gen-commit-msg
pkgver=0.0.1
pkgrel=1
pkgdesc="Generate git commit message candidates from staged changes"
arch=('x86_64' 'aarch64')
url="https://github.com/chpock/gen-commit-msg"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('git: collect staged change context' 'opencode: generate commit messages')
provides=("$pkgname=$pkgver")
conflicts=('gen-commit-msg-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chpock/gen-commit-msg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b2d6408128cfc317bbd0da3fc23bc7f166dc13b79b14aaeb686ea01a694ea6a')

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags "-X main.version=$pkgver" -o gen-commit-msg ./cmd/gen-commit-msg
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "gen-commit-msg" "$pkgdir/usr/bin/gen-commit-msg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
