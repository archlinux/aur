_pkgname=yap-frontend-cli
pkgname=yap-frontend-cli
pkgver=0.1.7
pkgrel=1
pkgdesc="A TUI for the yap planner written in rust"
arch=('x86_64')
source=("git+https://github.com/flammenderdrache/yap-frontend-cli.git")
url="https://github.com/flammenderdrache/yap-frontend-cli"
sha512sums=('SKIP')
makedepends=(
   'rust'
   'cargo'
   'git'
)

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked
}

check() {
    cd "${srcdir}/${_pkgname}"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}/yap"; cp ./theme.toml "${XDG_CONFIG_HOME:=$HOME/.config}/yap"
}
