# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=go-mod-outdated
pkgver=0.8.0
pkgrel=1
pkgdesc="Find outdated dependencies of your Go projects"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/psampaz/go-mod-outdated"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c9710be3a93b35f714bd31fd11529bbbb0802042bab442f51f859755bc0fcce5')

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "${extraflags} -extldflags \"${LDFLAGS}\"" \
        -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
