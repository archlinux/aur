# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.13.0'
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
sha256sums=('b1b63fbf7d4a1c380f84f0e0aca2f32a587686b333ae2c1a820436fc0488f54b')
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
