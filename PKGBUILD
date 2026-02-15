pkgname=pacviz
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI for managing Arch Linux pacman packages"
arch=('x86_64')
url="https://github.com/sjsanc/pacviz"
license=('MIT')
depends=('pacman')
makedepends=('go' 'gcc' 'pkg-config')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sjsanc/pacviz/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=1
    go build -ldflags "-s -w" -o pacviz ./cmd/pacviz
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pacviz "$pkgdir/usr/bin/pacviz"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
