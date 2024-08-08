# Maintainer: Arne Beer <public@arne.beer>
pkgname=harper
pkgver='0.9.2'
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
sha256sums=('cd67398790ff48ce52a74ba32173652795ef02234eeb857e35c80b9f60927db7')

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
