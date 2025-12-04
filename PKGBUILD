# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=waybar-lyric
pkgver=0.14.2
pkgrel=2
pkgdesc="A waybar module for song lyric"
arch=('x86_64')
url="https://github.com/Nadim147c/waybar-lyric"
license=('AGPL-3.0-only')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("glibc")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('66d921ab91bbefa2ae72d936450dc4ed9a8bf9b05256bac41ca597535699925e')

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit

    env GOPATH="$srcdir/go" \
        GOCACHE="$srcdir/go-cache" \
        GOMODCACHE="$srcdir/go/pkg/mod" \
        GOENV=off \
        CGO_ENABLED=0 \
        VERSION="$pkgver" \
        make build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make install PREFIX="$pkgdir/usr/"
}
