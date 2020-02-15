# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=git-trim
pkgver=0.1.4
pkgrel=1
pkgdesc='Trims your git remote tracking branches'
arch=('i686' 'x86_64')
url="https://github.com/foriequal0/git-trim"
license=('MIT')
depends=('libgit2')
conflicts=('git-trim-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('047f93c54ebf2764ee1b65737c14efd5a347605aa67f5788135cba10c29165e0')

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
