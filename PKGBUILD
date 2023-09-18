# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.3.0'
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
sha256sums=('b8cebdebd3845843f15f0040f36b7e06398de45c721679672e7107f8b735ab54')

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
