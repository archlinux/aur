# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-git
pkgver=r811.abc6c0c
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
provides=('calagopus-wings')
conflicts=('calagopus-wings-bin')
makedepends=('rust' 'cargo' 'git')

source=('calagopus-wings::git+https://github.com/calagopus/wings.git')
sha256sums=('SKIP')

pkgver() {
    cd "calagopus-wings"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "calagopus-wings"
    cargo build --release --locked
}

package() {
    cd "calagopus-wings"
    install -Dm755 "target/release/wings" "${pkgdir}/usr/bin/calagopus-wings"
}
