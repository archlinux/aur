# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=git-trim
pkgver=0.2.4
pkgrel=1
pkgdesc='Trims your git remote tracking branches'
arch=('i686' 'x86_64')
url="https://github.com/foriequal0/git-trim"
license=('MIT')
depends=('libgit2')
conflicts=('git-trim-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c3c386cdca7eeec8a8a3d959e80ec088be9db5300d9db21d639878b725cf64f')

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
