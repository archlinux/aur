# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=ycat
_pkgname=go-yaml
pkgver=1.2.0
pkgrel=1
pkgdesc='Print yaml files with color (powered by goccy/go-yaml)'
arch=('any')
url="https://github.com/goccy/go-yaml"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('96338e61872995a1b285d94b227b69aaaa18f1a718ffce757fc1ca2d5407599b')

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

