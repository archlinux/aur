# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('papeer')
pkgver=0.7.2
pkgrel=1
pkgdesc="Scrape the web in the eink era. Convert websites into ebooks and markdown."
arch=('x86_64')
license=('GPL')
url="https://github.com/lapwat/papeer"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('83796debf86f374d817b3bf9a93ccc6c218ef9625435eb6e109c5500f97a1953')
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
