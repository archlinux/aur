# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=git-trim
pkgver=0.3.2
pkgrel=2
pkgdesc='Trims your git remote tracking branches'
arch=('i686' 'x86_64')
url="https://github.com/foriequal0/git-trim"
license=('MIT')
depends=('libgit2')
conflicts=('git-trim-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08c65f0e821b12f5e512034df22723be9289e42102d478dae759f57905554f25')

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
