# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=aces
pkgver=2.2.10
pkgrel=1
pkgdesc='Encode in a character set of your choice'
arch=('x86_64')
url="https://github.com/quackduck/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29b10a580939f91e2cd352fbe2437c701f90eb7fb6f43c1f1a7e86477075626b')

build() {
    cd "$pkgname-$pkgver/cmd/aces"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 cmd/aces/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
