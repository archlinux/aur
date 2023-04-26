# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>

_pkgname="llama-rs"
pkgname="${_pkgname}-git"
pkgver=r342.6e8aa79
pkgrel=1
epoch=
pkgdesc="Run LLaMA inference on CPU, with Rust 🦀🚀🦙"
arch=(any)
url="https://github.com/setzer22/llama-rs"
license=('MIT' 'APACHE')
groups=()
depends=(glibc gcc-libs)
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=(llama-cli)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/setzer22/llama-rs.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    cat LICENSE-* > LICENSE
    cargo build --release
}

package() {
    cd llama-rs
    install -Dm755 target/release/llama-cli -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
