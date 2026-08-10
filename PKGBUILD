# Maintainer: Ben Fritsch <ich@abwesend.com>
pkgname=weave-merge
pkgver=0.3.6
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
sha256sums=('3795fcc28ada8b522fb0081a1b8f3ace6e4f61d7be46fdb3cf588777b5f0608f')

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
