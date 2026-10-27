# Maintainer: Ben Fritsch <ich@abwesend.com>
pkgname=weave-merge
pkgver=0.6.2
pkgrel=1
pkgdesc="Entity-level semantic merge CLI. Resolves conflicts at the function/class level instead of lines."
arch=('x86_64' 'aarch64')
url="https://github.com/Ataraxy-Labs/weave"
license=('MIT' 'Apache-2.0')
depends=(
  'glibc'
  'libgcc'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1370c274d4981dda7f4f1dacb834ff4bf5ee1f8b0a820259fc4b3e9348974e0')

build() {
    cd "weave-$pkgver"
    unset CFLAGS CXXFLAGS
    cargo build --release --workspace
}

package() {
    cd "weave-$pkgver"
    install -Dm755 "target/release/weave" "$pkgdir/usr/bin/weave"
    install -Dm755 "target/release/weave-driver" "$pkgdir/usr/bin/weave-driver"
    install -Dm755 "target/release/weave-github" "$pkgdir/usr/bin/weave-github"
    install -Dm755 "target/release/weave-mcp" "$pkgdir/usr/bin/weave-mcp"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
