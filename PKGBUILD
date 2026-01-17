# Maintainer: djwarf
pkgname=switchcalc
pkgver=1.1.2
pkgrel=1
pkgdesc="Complete calculator with Standard, Scientific, Programmer, and Date modes"
arch=('x86_64')
url="https://github.com/djwarf/switchcalc"
license=('MIT')
depends=('gtk4' 'glib2')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/djwarf/switchcalc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o switchcalc ./cmd/switchcalc
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 switchcalc "$pkgdir/usr/bin/switchcalc"
    install -Dm644 switchcalc.desktop "$pkgdir/usr/share/applications/switchcalc.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
