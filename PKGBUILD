# Maintainer: Ateles
pkgname=cidr
pkgver=2.3.0
pkgrel=1
pkgdesc="CLI tool for working with IPv4 and IPv6 CIDR ranges"
arch=('x86_64' 'aarch64')
url="https://github.com/bschaatsbergen/cidr"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("git+https://github.com/bschaatsbergen/cidr.git#commit=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go build -trimpath -buildvcs=false -o cidr .
}

check() {
    cd "$srcdir/$pkgname"
    make test
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "cidr"      "$pkgdir/usr/bin/cidr"
    install -Dm644 "LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
