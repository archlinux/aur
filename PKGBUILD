# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin
pkgver=3.0.0
_commit=4704037848261e09fe342469e31396eb205d8408
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
            'f44c95c1576d8edf48e182602c4b4f85f7c8ceb090c97d107c011f64bd4c1885')

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
