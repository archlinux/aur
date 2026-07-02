# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=waybar-lyric
pkgver=0.17.0
pkgrel=2
pkgdesc="A waybar module for song lyric"
arch=('x86_64' 'aarch64')
url="https://github.com/Nadim147c/waybar-lyric"
license=('AGPL-3.0-only')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("glibc")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e7a9d14926e5c0e21ff2d582d82a2608a621ab10bf17bcfe5b612330973d4ce')

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
