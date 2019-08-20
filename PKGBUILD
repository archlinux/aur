# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.12.0'
pkgrel='1'
arch=('x86_64')
url='https://starship.rs/'
license=('ISC')
depends=('openssl' 'zlib')
makedepends=('rust' 'gcc')
checkdepends=('rust')
provides=(starship)
#install="$pkgname.install"
source=("https://github.com/starship/starship/archive/v${pkgver}.tar.gz")
sha256sums=('d4315059a4f2d1e4997fbed8f46f1b716c58e53c6bb9f7f3eb2c4004a24b198a')
PKGEXT='.pkg.tar.gz'

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/starship" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
