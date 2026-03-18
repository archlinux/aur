# Maintainer: Mahmud Ridwan <m@hjr265.me>
pkgname=gittop
pkgver=0.2.0
pkgrel=1
pkgdesc='A beautiful terminal UI for visualizing Git repository statistics'
arch=('x86_64' 'aarch64')
url='https://github.com/hjr265/gittop'
license=('BSD-3-Clause')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hjr265/gittop/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ${pkgname} .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
