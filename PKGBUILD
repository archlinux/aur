# Maintainer: uIvPuGpT <bliss@hoosh.cat>
pkgname=fauthy
pkgver=1.0.0
pkgrel=1
pkgdesc="minimal 2fa authenticator with local encrypted storage"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/uIvPuGpT/fauthy"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e5e4e878e70567c7d018e29c9c0b0f8f0bfa61e318c16e9222da38c7bff7c55')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o $pkgname .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
