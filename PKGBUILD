# Maintainer: hexchain <i@hexchain.org>

pkgname=tunasay
pkgver=0.0.0+git01d877f
pkgrel=1
pkgdesc="A configurable talking tuna"
url="https://github.com/tuna/tunasay"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("nodejs" "yarn")
source=("$pkgname::git+$url#commit=01d877f52cb289e3e0202db32cbb45e97502c1e5")
sha256sums=('SKIP')
options=(!strip)

build() {
    cd "$srcdir/$pkgname"
    yarn install
    chmod +x cli.js
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -dm755 "$pkgdir/usr/lib/" "$pkgdir/usr/bin"
    cd "$srcdir"
    cp -rv --no-preserve='ownership' "$srcdir/$pkgname" "$pkgdir/usr/lib/"
    rm -rf "$pkgdir/usr/lib/$pkgname/.git"
    ln -sf "/usr/lib/$pkgname/cli.js" "$pkgdir/usr/bin/tunasay"
}
