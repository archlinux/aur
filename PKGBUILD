# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('gomod')
pkgver=0.7.1
pkgrel=3
pkgdesc="Go modules analysis tool"
arch=('x86_64')
license=('MIT')
url="https://github.com/Helcaraxan/gomod"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b3fc070c32454691a1e48f643b83563d3aa1c6c2c96ddd9ce892ac0f20cae68c')
makedepends=('go' 'git' 'glibc')

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
    install -Dm 755 -t "${pkgdir}/usr/bin" gomod
}
