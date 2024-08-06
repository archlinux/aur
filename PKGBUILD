# Maintainer: Arne Beer <public@arne.beer>
pkgname=harper
pkgver='0.9.0'
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
sha256sums=('d4291bd58032a31095c27fb84c928fd2b0724b89d9e3ccbf3064fbf80a780778')

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
