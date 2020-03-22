# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.5.0'
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
sha256sums=('93a460275e32df284708ded4534d2848ac0467d0cd8dfa2c568f0412ef969af0')

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
