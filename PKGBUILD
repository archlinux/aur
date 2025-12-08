# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=rong
pkgver=3.3.0
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
sha256sums=('86ed7bc4f23b07c42c3576293a821f65db4adb5614f219d01dfec57f6c453879')

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
