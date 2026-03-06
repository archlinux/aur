# Maintainer: CELESTIFYX Team <celestifyx@gmail.com>

pkgname="lynxfetch"
pkgver=1.1.2
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
sha512sums=("6bfa340b4ef8f3f404863a9c0a7fadceb1dd6acc77b30771c551d5671a8d49253ef67877b1ffb1ed031f83aee6845ecdd3da81ecfe3a4c512ca9acac950b1ba6")

package() {
    cd "${pkgname}-${pkgver}"

    cargo build -r
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"

    install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "completions/${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
