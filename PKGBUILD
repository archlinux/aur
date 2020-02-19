# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=terraform-lsp
pkgver=0.0.10
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64' 'i686')
url="https://github.com/juliosueiras/terraform-lsp"
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('994025cab5d312f819d0f2ae2f0e344dbbce1bd65e64aa31c0452b37cb60ba93')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o $pkgname .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
