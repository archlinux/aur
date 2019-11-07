# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=ycat
_pkgname=go-yaml
pkgver=1.0.6
pkgrel=1
pkgdesc='Print yaml files with color (powered by goccy/go-yaml)'
arch=('any')
url="https://github.com/goccy/go-yaml"
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('79c4608e2826cb4c8dd1dba50494a76f330e4b47fce598668690dfa61dfb7779')

build() {
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath"
    cd $_pkgname-$pkgver/cmd/$pkgname
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -o $pkgname \
        .
}

package() {
    cd $_pkgname-$pkgver/cmd/$pkgname
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

