# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare
pkgver=0.20.9
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
makedepends=('go')
provides=('skillshare')
conflicts=('skillshare-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('04cfac019e2820ac2e7407f9ccedd5bcf1b6354784592de5d1f21bcda6f5f9ae')

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
