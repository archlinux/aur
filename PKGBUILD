# Maintainer: Damian Dimanov <damian.dimanov@gmail.com>

pkgname=zoekt
pkgver=20250915.r1866.g4e4a529c
pkgrel=1
pkgdesc="Fast trigram-based code search engine (latest git)"
arch=('x86_64')
url="https://github.com/sourcegraph/zoekt"
license=('Apache')
depends=('go')
makedepends=('git' 'go')
provides=('zoekt')
conflicts=('zoekt')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/zoekt"
    printf "%s.r%s.g%s" \
        "$(date +%Y%m%d)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/zoekt"

    go build -v -o zoekt ./cmd/zoekt
    go build -v -o zoekt-git-index ./cmd/zoekt-git-index
    go build -v -o zoekt-index ./cmd/zoekt-index
    go build -v -o zoekt-indexserver ./cmd/zoekt-indexserver
    go build -v -o zoekt-webserver ./cmd/zoekt-webserver
}

package() {
    cd "$srcdir/zoekt"

    install -Dm755 zoekt "$pkgdir/usr/bin/zoekt"
    install -Dm755 zoekt-git-index "$pkgdir/usr/bin/zoekt-git-index"
    install -Dm755 zoekt-index "$pkgdir/usr/bin/zoekt-index"
    install -Dm755 zoekt-indexserver "$pkgdir/usr/bin/zoekt-indexserver"
    install -Dm755 zoekt-webserver "$pkgdir/usr/bin/zoekt-webserver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

