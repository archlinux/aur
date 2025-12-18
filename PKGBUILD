# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=rong
pkgver=4.1.0
pkgrel=1
pkgdesc="A Material You and Base16 color generator"
arch=('x86_64')
url="https://github.com/Nadim147c/rong"
license=('GPL-3.0-only')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("glibc" "ffmpeg")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('14b310ac2eebe7b8ec7a4d20dab9aa4d3e3493716f6c797fc7cc6fa669ddc7a4')

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
