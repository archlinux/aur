# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=zsa-wally-cli
pkgver=2.0.0
pkgrel=5
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally-cli"
# See https://github.com/zsa/wally-cli/issues/6
#license=('MIT')
license=('unknown')
depends=('libusb')
makedepends=('go')
conflicts=('zsa-wally-cli-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver-linux.tar.gz"
    '50-wally-cli.rules'
)
sha256sums=('2641c7deededeeba1aecf6b3ae3e87050a0cfd81c8b41323b2304ebe21e61745'
            'fb0486730617d8ef8524229fda63d256a61097ab2503e865edf5c7116d57df7d')

build() {
    cd "wally-cli-$pkgver-linux"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    go build
}

package() {
    cd "wally-cli-$pkgver-linux"

    install -Dm755 wally-cli "$pkgdir/usr/bin/wally-cli"
    # Not present yet, see https://github.com/zsa/wally-cli/issues/6
    #install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/license.md"
}
