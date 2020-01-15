# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=terraform-lsp
pkgver=0.0.9
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64' 'i686')
url="https://github.com/juliosueiras/terraform-lsp"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz"
        'fix-build.patch')
sha256sums=('04195dd8b50f3fbe0b00d60e4d82f5b9737b51ac394df5a91577974a62220815'
            'ec9b52a9bd55ad9b86ac7724e2840903b545eb7aa4a8b814f385f181b2c873d9')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/fix-build.patch"
}

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
