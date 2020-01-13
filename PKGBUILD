# Maintainer: Bart Libert <bart dot libert at gmail dot com>
pkgname=vim-pack
pkgver=0.2.5
pkgrel=1
pkgdesc="The missing vim8 package manager"
arch=('x86_64')
url="https://github.com/maralla/pack"
license=('MIT')
depends=('zlib' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maralla/pack/archive/v$pkgver.tar.gz")
sha256sums=('f3494bfa002af17792df54845f225a154cfab33203e7ee49d43a8eb91794fa2a')
conflicts=('pack-cli' 'allegro4')

prepare() {
    cd "pack-$pkgver"

    sed -i 's/version = "0.2.3"/version= "0.2.5"/' Cargo.lock
}

build() {
    cd "pack-$pkgver"

    cargo build --release --locked
}

check() {
    cd "pack-$pkgver"

    cargo test --release --locked
}

package() {
    cd "pack-$pkgver"

    install -Dm755 target/release/pack "$pkgdir/usr/bin/pack"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 contrib/_pack "$pkgdir/usr/share/zsh/site-functions/_pack"
    install -Dm644 contrib/pack.bash "$pkgdir/usr/share/bash-completion/completions/pack"
    install -Dm644 contrib/pack.fish "$pkgdir/usr/share/fish/vendor_completions.d/pack.fish"
}
