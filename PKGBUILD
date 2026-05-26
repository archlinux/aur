# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare
pkgver=0.19.22
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
makedepends=('go')
provides=('skillshare')
conflicts=('skillshare-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1495bc6320a0c2dd7c6b68f44c937300dffbcae1db055c009a9318260bc13000')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -buildmode=pie -trimpath -mod=readonly \
        -ldflags="-w -s -X main.version=v${pkgver}" \
        -o "${pkgname}" ./cmd/skillshare
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
