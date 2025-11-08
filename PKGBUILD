# Maintainer: lordbord <your-email@example.com>
pkgname=starsearch
pkgver=0.1.2
pkgrel=1
pkgdesc="A modern, feature-rich Gemini protocol browser built with Go and Bubble Tea TUI framework"
arch=('x86_64' 'aarch64')
url="https://github.com/lordbord/starsearch"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lordbord/starsearch/archive/v$pkgver.tar.gz")
sha256sums=('abb92109c77cad43d2e8cdb56bd1c640b5a0bb0b57c842e216615d0ab4503db8')

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
