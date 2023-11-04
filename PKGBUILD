# Maintainer: Gustavo Vinícios de Souza <gnsfujiwara@disroot.org>

pkgname=kemono-scraper
pkgver=0.0.21
pkgrel=1
pkgdesc='A simple downloader to download media from kemono.party'
arch=('x86_64')
url='https://github.com/elvis972602/Kemono-scraper'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/elvis972602/Kemono-scraper/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4fa3cc67688a90af1dc0f80b413da46eeb3f9a79cbfae227388dcd4d4b4da737')

build() {
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    cd "${srcdir}/Kemono-scraper-${pkgver}/main"

    go mod tidy
    go build -o kemono-scraper
}

package() {
    cd "${srcdir}/Kemono-scraper-${pkgver}/main"
    install -Dm755 kemono-scraper "${pkgdir}/usr/bin/kemono-scraper"
}
