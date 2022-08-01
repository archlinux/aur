pkgname=rust-cowsay
pkgver=0.1.4
pkgrel=1
pkgdesc="Cowsay rewritten in Rust."
url="https://github.com/ThisNekoGuy/rust-cowsay"
license=("MIT")
arch=("any")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("cowsay")
conflicts=("cowsay" "cowsay-bin" "rust-cowsay-git" "cowsay-git")
source=("git+https://github.com/ThisNekoGuy/rust-cowsay")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/rust-cowsay"
    git checkout v${pkgver}
}

build() {
    cd "${srcdir}/rust-cowsay"
    cargo build --release
}

package() {
    install -Dm755 "${srcdir}/rust-cowsay/target/release/cowsay" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/rust-cowsay/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
