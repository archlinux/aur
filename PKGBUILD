# Maintainer: Your Name <youremail@domain.com>

_pkgname=espanso
pkgname=${_pkgname}
pkgver=0.2.3
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip" "libxtst")
makedepends=("rust" "git")
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/federico-terzi/espanso.git#tag=v${pkgver}"
        "service")
sha512sums=('SKIP'
            '5eb7b751e9432c7dde71da1f0c8c459b33a6a15d3a81aa21cbaa251b7b2cdddc47da9a0ab22215a9fb063ecdd8123c86c8f96459e627fd6daff4e690ff1a6df2')


check() {
    cd "$_pkgname"

    cargo test --release --locked
}

build() {
    cd "$_pkgname"

    cargo build --release --locked
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "../service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
