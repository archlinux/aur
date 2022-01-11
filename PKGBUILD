# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=knoxite-git
pkgver=r696.4388cb0
pkgrel=1
pkgdesc="A data storage & backup system"
arch=('x86_64')
url="https://github.com/knoxite/knoxite"
license=('MIT')
makedepends=('go' 'git')
provides=("knoxite")
conflicts=("knoxite")
source=($pkgname::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/$pkgname/cmd/knoxite
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "knoxite" .
}

package() {
    cd "$srcdir"/$pkgname
    install -Dm755 "cmd/knoxite/knoxite" "$pkgdir/usr/bin/knoxite"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
