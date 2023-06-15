# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.1.6'
pkgrel='1'
arch=('x86_64' 'aarch64')
url='https://github.com/samwho/spacer'
license=('MIT')
depends=('gcc-libs')
optdepends=()
makedepends=('rust' 'gcc' 'binutils')
checkdepends=('rust' 'git')
provides=(spacer)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samwho/spacer/archive/v${pkgver}.tar.gz")
sha256sums=('5d25b89722cc0247820c9dd16fdb8ad21e68019b6d8850f50c0e48686c3c73d0')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test
}

package() {
    cd "$pkgname-$pkgver"
    strip target/release/spacer
    install -Dm755 "target/release/spacer" "$pkgdir/usr/bin/spacer"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
