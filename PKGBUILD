# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin
pkgver=1.0.3
_commit=4f52209cd01c90066683df59e3629d6d93bf94f0
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
            '4478b8ecf0f7d3e9519bec0f03f969b7b4f3247f7abb5dd8bc25b2e6a5cbb39f')

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
