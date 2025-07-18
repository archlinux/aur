# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.4.2'
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
sha256sums=('7408b9ebefac040110cc3f4ee12ccdc320ca8aa88f9d306304f3e8878103fd10')

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
