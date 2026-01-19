# Maintainer: Josh Elias <josh at daemontech dot tools>
pkgname=gurren
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, terminal-based SSH tunnel manager with TUI and background daemon"
arch=('x86_64')
url="https://github.com/JoshElias/gurren"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JoshElias/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('033b0873894f235411162e997d4ceb8b344535c427a7ff5ffc7d7e4617bfac9f')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o gurren .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 gurren "$pkgdir/usr/bin/gurren"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
