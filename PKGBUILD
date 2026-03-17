# Maintainer: kellyson71 <https://github.com/kellyson71>

pkgname=supaco-cli
pkgver=1.0.1
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
sha256sums=('940de0d7f2275e226aa9ae2818b2a5b37572bfb299742afeefaad7bcc7c3d9e2')

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
