# Maintainer: kellyson71 <https://github.com/kellyson71>

pkgname=supaco-cli
pkgver=1.0.3
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
sha256sums=('eae259214121b2a89884a9edf1ef20b62733dba6f502333a33c270815deb4700')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build -trimpath -mod=vendor -ldflags="-s -w" -o supaco .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 supaco "$pkgdir/usr/bin/supaco"
    install -Dm644 completions/supaco.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/supaco.fish"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
