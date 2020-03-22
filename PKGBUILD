# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.4'
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
sha256sums=('8a810c1993d459351b51ceb8ccda4f30ba4b3b259137b2da11a5dcc5274255d1')

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
