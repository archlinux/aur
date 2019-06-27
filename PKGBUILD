# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin
pkgver=1.1.0
_commit=a89a1024b6dd7cc5d3def6b41edae0e46b55658d
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
            '6299aee995452c807e382a1bb4f316725295f69b567df51b31391409781481cd')

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
