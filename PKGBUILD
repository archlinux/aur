# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.5.2'
pkgrel='1'
arch=('x86_64')
url='https://github.com/samwho/hmm'
license=('MIT')
depends=('gcc-libs')
optdepends=()
makedepends=('rust' 'gcc' 'binutils')
checkdepends=('rust' 'git')
provides=(hmm hmmq hmmp)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samwho/hmm/archive/v${pkgver}.tar.gz")
sha256sums=('17da05c38a1a0fe083a86ba750a0d5b9ccd046e5baa75d98493143f978d97a29')

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
    strip target/release/hmm
    strip target/release/hmmq
    strip target/release/hmmp
    install -Dm755 "target/release/hmm" "$pkgdir/usr/bin/hmm"
    install -Dm755 "target/release/hmmq" "$pkgdir/usr/bin/hmmq"
    install -Dm755 "target/release/hmmp" "$pkgdir/usr/bin/hmmp"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
