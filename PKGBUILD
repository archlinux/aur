# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.2'
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
sha256sums=('7dd19ca312661250f6ce47feaeb5ee50c17f72c0b92a9413a476d8b1445935e0')

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
