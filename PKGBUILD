# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=pgschema
pkgver=1.12.4
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
sha256sums=('b3008748bf6bd5f90086c1721fe274078d427622a1887b1c8aeb1271d55bf639')

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
