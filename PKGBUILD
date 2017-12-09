# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>

pkgname=migrate

pkgver=v3.0.1.r89.gd23f71b
pkgrel=1
pkgdesc="Database migration handling in Golang"
url="https://github.com/mattes/migrate"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('go')
options=('!strip' '!emptydirs')
depends=()
makedepends=()

source=(git://github.com/mattes/migrate.git)
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    GOPATH="$srcdir"
    rm -rf "$srcdir/src/github.com/mattes"
    mkdir -p "$srcdir/src/github.com/mattes"
    mv "$srcdir/migrate" "$srcdir/src/github.com/mattes"

    go build -v -o migrate-bin github.com/mattes/migrate
}

package() {
    install -Dm755 "migrate-bin" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/src/github.com/mattes/migrate/LICENSE" "$pkgdir/usr/share/licenses/migrate/LICENSE"
}
