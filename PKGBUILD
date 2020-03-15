# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm'
pkgdesc='A small command-line note taking app written in Rust. Notes are written in plain text and indexed by the time they were written.'
pkgver='0.1.2'
pkgrel='1'
arch=('x86_64')
url='https://github.com/samwho/hmm'
license=('MIT')
depends=('zlib' 'gcc-libs')
optdepends=()
makedepends=('rust' 'gcc')
checkdepends=('rust' 'git')
provides=(hmm)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samwho/hmm/archive/v${pkgver}.tar.gz")
sha256sums=('0945fc99a7f816744585f1cfa8babd0e830f59df68238b8be26b0ef35768ed0d')

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
    install -Dm755 "target/release/hmm" "$pkgdir/usr/bin/hmm"
    install -Dm755 "target/release/hmmq" "$pkgdir/usr/bin/hmmq"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
