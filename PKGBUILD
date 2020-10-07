# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=dendrite
pkgver=0.1.0rc3
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64')
url='https://github.com/matrix-org/dendrite'
license=('Apache')
makedepends=('git' 'go')
source=("git+https://github.com/matrix-org/dendrite.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    go build ./cmd/dendrite-monolith-server
}

package() {
    cd "$pkgname"
    install -Dm755 dendrite-monolith-server "${pkgdir}/usr/bin/dendrite"
}
