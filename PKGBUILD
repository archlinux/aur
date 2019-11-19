# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=grin
pkgver=2.1.1
_commit=6d1bc3a1f921d9d9ff51c739ff1b0fadc434881b
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
            'fa86d0075c1adfb6a92d0db8df6b5012250527f14f566dfb52fd64958b8bc04f')

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
