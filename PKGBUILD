# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=gitui
pkgver=0.3.0
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2')
conflicts=('gitui-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e34f34bc7583c17562243c2255b46215610dfea5127af0ee6bb3971aed746239')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable LIBGIT2_SYS_USE_PKG_CONFIG=1 \
    /usr/bin/cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
