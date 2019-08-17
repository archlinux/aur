# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.10.1'
pkgrel='1'
arch=('x86_64')
url='https://starship.rs/'
license=('ISC')
depends=('openssl' 'zlib')
makedepends=('rust')
checkdepends=('rust')
provides=(starship)
#install="$pkgname.install"
source=("https://github.com/starship/starship/archive/v${pkgver}.tar.gz")
sha256sums=('ef09ad28ef73619b7d86bc6c5713a2e423c1fa4d6403c2983e8692e6b4fc2a98')
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
