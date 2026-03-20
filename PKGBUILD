# Maintainer: Elwqnn
pkgname=wfc-cli-git
pkgver=0.2.0.r27.1890263
pkgrel=1
pkgdesc="Wave Function Collapse image generator CLI"
arch=('x86_64')
url="https://github.com/Elwqnn/wfc"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('wfc')
conflicts=('wfc')
source=("git+https://github.com/Elwqnn/wfc.git")
sha256sums=('SKIP')

pkgver() {
    cd wfc
    printf "%s.r%s.%s" "0.2.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd wfc
    export CARGO_TARGET_DIR=target
    cargo build --release -p wfc-cli
}

package() {
    cd wfc
    install -Dm755 target/release/wfc "$pkgdir/usr/bin/wfc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
