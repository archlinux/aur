# Maintainer: Martin Kröning (mkroening) <m.kroening@hotmail.de>

pkgname=edu-sync-git
pkgver=0.3.2.r0.g4177e02
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
arch=('x86_64')
url="http://edu-sync.org/"
license=('GPL3')
depends=()
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip !lto)
source=("${pkgname%-git}::git+https://github.com/${pkgname%-git}/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname%-git}
    cargo fetch --locked
}

build() {
    cd ${pkgname%-git}
    cargo build --release --frozen
}

check() {
    cd ${pkgname%-git}
    cargo test --release --frozen
}

package() {
    cd ${pkgname%-git}
    install -Dm 755 target/release/${pkgname%-git}-cli -t "$pkgdir/usr/bin"
}
