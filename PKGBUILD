# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=codegrab
pkgname=$_projectname-git
pkgrel=3
pkgver=r68.39cea2c
pkgdesc="CLI and TUI for selecting and bundling code into a single, LLM-ready output file"
arch=("x86_64")
url="https://github.com/epilande/codegrab"
license=('MIT')
makedepends=("go" "git")
provides=("codegrab")
conflicts=("codegrab")
source=(git+$url.git)
sha256sums=("SKIP")

pkgver() {
    cd $_projectname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_projectname
    go build ./cmd/grab
}

package() {
    cd $_projectname
    install -Dm 755 grab "$pkgdir/usr/bin/grab"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
