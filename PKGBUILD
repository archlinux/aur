# Maintainer: MCB-SMART-BOY <mcb@neve-lang.org>
# Contributor: Neve Language Team

pkgname=neve
pkgver=3.7.0
pkgrel=1
pkgdesc="A strongly-typed systems scripting language with formal verification"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=('lean4: formal verification')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Neve-$pkgver"
    cargo build --release --locked -p neve
}

check() {
    cd "$srcdir/Neve-$pkgver"
    cargo test --workspace --locked
}

package() {
    cd "$srcdir/Neve-$pkgver"
    install -Dm755 target/release/neve "$pkgdir/usr/bin/neve"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
