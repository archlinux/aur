# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin
pkgver=1.0.0
_commit=e7485ab5f1ad5160a42c4230bb523ca3558e7adc
pkgrel=1
pkgdesc='Minimal implementation of the MimbleWimble protocol'
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin'
license=('Apache')
depends=('ncurses')
makedepends=('clang' 'git' 'rust')
backup=('etc/grin/server.toml')
source=("git+https://github.com/mimblewimble/grin.git#commit=${_commit}"
        'grin-server.service'
        'grin-server.toml')
sha256sums=('SKIP'
            '5a9b2c30bd95d8ccb4666dcc97b2811c4b5ec501162b6178a1850b5b2fc95de9'
            '8c8bcd780443b19b1947e57610830c2deaa4e15c799bed4c0c68477efb53a62a')

build() {
    cd ${pkgname}

    cargo build --release
}

package() {
    cd ${pkgname}

    install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ../grin-server.service
    install -Dm644 ../grin-server.toml "${pkgdir}/etc/grin/server.toml"
}
