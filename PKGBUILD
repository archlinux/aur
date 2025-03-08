# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('papeer')
pkgver=0.8.4
pkgrel=1
pkgdesc="Scrape the web in the eink era. Convert websites into ebooks and markdown."
arch=('x86_64')
license=('GPL')
url="https://github.com/lapwat/papeer"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fda2265c80f0ffbec718b83a683c70e447ecb0fcea9b61a208855bf9a5a4262b')
makedepends=('go')
depends=('glibc')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 -t "${pkgdir}/usr/bin" $pkgname
}
