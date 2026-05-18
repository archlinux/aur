# Maintainer: CELESTIFYX Team <celestifyx@gmail.com>

pkgname="lynxfetch"
pkgver=1.1.4
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
sha512sums=("cdbf28238faa58248ba09dc67530b169af6f2d0edb01e7db3fe9470d8feb380c4345f98a9ccacfa1fa773d0e936cdb6a2730bb31c37de0b1dccb00c482d90923")

package() {
    cd "${pkgname}-${pkgver}"

    cargo build --release
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"

    install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "completions/${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
