# Maintainer: kellyson71 <https://github.com/kellyson71>

pkgname=supaco-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal TUI para o SUAP do IFRN — aulas, frequência, notas e notificações no terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/kellyson71/supaco-cli"
license=('MIT')
depends=()
makedepends=('go')
provides=('supaco')
conflicts=('supaco')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kellyson71/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('710ee53c350916e5cfb0439112e5afd44213d48228b8d2fb5c1e27641e081420')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"
    go build -trimpath -ldflags="-s -w" -o supaco .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 supaco "$pkgdir/usr/bin/supaco"
    install -Dm644 completions/supaco.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/supaco.fish"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
