# Maintainer: novica <nnovica@gmail.com>

pkgname=ggsql
pkgver=0.5.2 # renovate: datasource=github-releases depName=posit-dev/ggsql
pkgrel=1
pkgdesc="SQL extension for declarative data visualization"
url="https://github.com/posit-dev/ggsql"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    glibc
    libgcc
)
conflicts=('ggsql-bin')
makedepends=('rust' 'tree-sitter-cli' 'nodejs' 'libstdc++')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/posit-dev/ggsql/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked -p ggsql-cli -p ggsql-jupyter
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 target/release/ggsql "${pkgdir}/usr/bin/ggsql"
    install -Dm755 target/release/ggsql-jupyter "${pkgdir}/usr/bin/ggsql-jupyter"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('154e2e85cfe011234648201e18da1da306abe9336cd5f409a28d3edb3000b19b806e7f041e5d572e479f5123afde301fbc5dc8d6b191291b40f3b8b013fe4d85')
