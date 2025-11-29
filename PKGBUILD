# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=rong
pkgver=3.2.0
pkgrel=2
pkgdesc="A Material You and Base16 color generator"
arch=('x86_64')
url="https://github.com/Nadim147c/rong"
license=('GPL-3.0-only')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("glibc" "ffmpeg")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('516992ceecd7055ebd68e1f15e953bc189439158940d41abec156d641aeed9cc')

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit

    env GOPATH="$srcdir/go" \
        GOCACHE="$srcdir/go-cache" \
        GOMODCACHE="$srcdir/go/pkg/mod" \
        GOENV=off \
        CGO_ENABLED=0 \
        VERSION="$pkgver" \
        make build generate-completion
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make install PREFIX="$pkgdir/usr/"
}
