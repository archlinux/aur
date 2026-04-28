# Maintainer: DrCoomer <isfortner@gmail.com>
pkgname=blahaj-rs-git

pkgver=r124.9c0e565
pkgrel=1
pkgdesc="Gay sharks at your local terminal - but in rust! lolcat-like CLI tool "
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Doctor-Coomer/BLAHAJ-rs"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('git' 'cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=('blahaj' 'blahaj-git' 'blahaj-d' 'blahaj-d-git')
replaces=()
backup=()
options=('!debug')
install=
changelog=
source=("git+https://github.com/Doctor-Coomer/BLAHAJ-rs.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "BLAHAJ-rs"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "BLAHAJ-rs"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "BLAHAJ-rs"
    mv "target/release/blahaj-rs" "target/release/blahaj" # Rename binary to a common name
    install -Dm755 "target/release/blahaj" -t "$pkgdir/usr/bin/"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
