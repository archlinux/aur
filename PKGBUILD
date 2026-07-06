# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=pgschema
pkgver=1.12.0
pkgrel=1
pkgdesc='Declarative schema migration CLI for Postgres (Terraform-style)'
arch=('x86_64' 'aarch64')
url='https://github.com/pgplex/pgschema'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=('pgschema')
conflicts=('pgschema-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('68e627939cc8e1eced8de79cbad6a6ceb809ca3bbe06831677da631f8134b7f5')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o pgschema .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 pgschema "${pkgdir}/usr/bin/pgschema"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
