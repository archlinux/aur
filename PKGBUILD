# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=skillshare
pkgver=0.30.10
pkgrel=1
pkgdesc='Sync skills across all AI CLI tools with one command'
arch=('x86_64' 'aarch64')
url='https://github.com/runkids/skillshare'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('skillshare-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a6f0476384f2b915e3b631b8d64a82d07d6521d20a54bd440c5c6dda4fea68b3')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags="-X main.version=v${pkgver}" -o "${pkgname}" ./cmd/skillshare
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
