# Maintainer: novica <nnovica@gmail.com>

pkgname=ggsql
pkgver=0.4.1 # renovate: datasource=github-releases depName=posit-dev/ggsql
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

sha512sums=('88438a2b98a6c8bbcde885f47f4aac21c6dddcfe3e3a2b4ab732089542f2e7de61673f47c9ffa3e5413a8e3f9ab3aaaf52824debf60eab850010c20f6bcfacb8')
