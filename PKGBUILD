# Maintainer: Arne Beer <public@arne.beer>
pkgname=harper
pkgver='0.10.0'
pkgrel=1
arch=('any')
pkgdesc='The Grammar Checker for Developers.'
license=('MIT')
makedepends=('git' 'rust')
conflicts=()
provides=('harper')
options=(!lto)
url='https://github.com/elijah-potter/harper'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/elijah-potter/harper/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7e2dadc3e5f394f505bc2b4e05f63857b9a2f568d84fa8e403aa557f1a6d0d6e')

build() {
    cd "$pkgname-$pkgver"

    # Build the daemon and client
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # Install binaries
    install -Dm755 "target/release/harper-ls" "${pkgdir}/usr/bin/harper-ls"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/geil/LICENSE"
}
