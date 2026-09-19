# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare
pkgver=0.21.1
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
makedepends=('go')
provides=('skillshare')
conflicts=('skillshare-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('42fa18a329220a6f26ce4484fa4c0d68581890f5db0b2a0f820b6e4e3dda2149')

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
