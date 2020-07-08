# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=borealis-git
pkgver=r13.783c889
pkgrel=1
pkgdesc="Asus Aura Sync driver application for Linux"
url="https://github.com/Philpax/borealis"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
licence=(MIT)
depends=()
makedepends=(rust git)
source=("git+https://github.com/Philpax/borealis.git")
sha256sums=('SKIP')

pkgver() {
    cd borealis
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd borealis
    cargo build --release
}

package() {
    cd borealis
    install -Dm755 target/release/borealis "${pkgdir}/usr/bin/borealis"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
