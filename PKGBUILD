# Maintainer: CELESTIFYX Team <celestifyx@gmail.com>

pkgname="lynxfetch"
pkgver=1.1.3
pkgrel=1
pkgdesc="Super fast, versatile, and customizable command-line fetcher."
arch=("x86_64")
makedepends=("cargo")

depends=("glibc"
    "gcc-libs"
    "pkg-config"
    "libdrm"
    "dbus")

source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("1bc09348d8f4f74f914299d08ee9a42a549d06ef03813bd9ab9d7fe572fa367cd8754fbe43a03d3886230032b239b14623bf5eedb21785f563e4c0d495f8bc8c")

package() {
    cd "${pkgname}-${pkgver}"

    cargo build -r
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"

    install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "completions/${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
