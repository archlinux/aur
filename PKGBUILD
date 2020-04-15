# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.3.2
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('bc74b61c761d4c16d622257396b5f554')
sha1sums=('81da9379874d6b4e8385ee2fe2b23a9f17c95993')
sha512sums=('43e7c30ca2b1b83b0e725a3660223179e885b55f7704ab122a2f7199f753c768774c24c58f1fc1bd8022ebe90664431a461f44106560e3e04118757d9d9241d6')

build() {
  cd "$pkgname-$pkgver"

  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/git-gone.1" "$pkgdir/usr/share/man/man1/git-gone.1"
}
