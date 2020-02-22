# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=xo-sql-git
_pkgname=xo
pkgver=r202.1a94fa5
pkgrel=1
pkgdesc='Command line tool to generate idiomatic Go code for SQL databases'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/xo"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"

    go build \
        -gcflags="all=-trimpath=$PWD" \
        -asmflags="all=-trimpath=$PWD" \
        -ldflags="-extldflags $LDFLAGS" \
        -o $_pkgname
}

package() {
    cd $_pkgname
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
