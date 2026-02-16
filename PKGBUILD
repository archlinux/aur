# Maintainer: AuroraNasa
pkgname=knob-control
pkgver=3
pkgrel=1
pkgdesc="A lightweight volume knob controller with device switching and brightness control."
arch=('x86_64' 'aarch64')
url="https://github.com/Aurora-Nasa-1/knob-control"
license=('MIT')
depends=('pipewire' 'libevdev' 'ddcutil')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4413597c2d8ac09a8cf8ed9116af3ed9d0d6c770d5a9b1f688de6aabaf128b28')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o knob-control .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 knob-control "${pkgdir}/usr/bin/knob-control"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
