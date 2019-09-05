# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.14.1'
pkgrel='1'
arch=('x86_64')
url='https://starship.rs/'
license=('ISC')
depends=('openssl' 'zlib')
makedepends=('rust' 'gcc')
checkdepends=('rust' 'git')
provides=(starship)
#install="$pkgname.install"
source=("https://github.com/starship/starship/archive/v${pkgver}.tar.gz")
sha256sums=('2847dcfb604ae1ba49b99310cc0d2a279e8f3f57d17806c219df9fb8c6196c49')
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
