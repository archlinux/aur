# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.4.5'
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
sha256sums=('543ad6081bb61cfd69aa5feb88efb4c10b217a4755c871f688e44693ff3b5b1c')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    /usr/bin/cargo test
}

package() {
    cd "$pkgname-$pkgver"
    strip target/release/spacer
    install -Dm755 "target/release/spacer" "$pkgdir/usr/bin/spacer"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
