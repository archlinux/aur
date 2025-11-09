# Maintainer: lordbord <your-email@example.com>
pkgname=starsearch
pkgver=0.1.3
pkgrel=1
pkgdesc="A modern, feature-rich Gemini protocol browser built with Go and Bubble Tea TUI framework"
arch=('x86_64' 'aarch64')
url="https://github.com/lordbord/starsearch"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lordbord/starsearch/archive/v$pkgver.tar.gz")
sha256sums=('631371db6ef54eb8d750f119d0bd07af3182708d1d99da55bb2499b38374fe69')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o starsearch ./cmd/starsearch
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 starsearch "$pkgdir/usr/bin/starsearch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
