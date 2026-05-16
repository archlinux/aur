# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=gen-commit-msg
pkgver=0.0.2
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
sha256sums=('98c35c2bedf139fa83ed18e6113acaa2ff83565a718d8cac2f7958e422daf9b1')

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags "-X main.version=$pkgver" -o gen-commit-msg ./cmd/gen-commit-msg
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "gen-commit-msg" "$pkgdir/usr/bin/gen-commit-msg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
