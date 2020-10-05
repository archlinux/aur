# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.3.7
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('ec7b090534f56782f7047dbe726b9176')
sha1sums=('820538f4965373b4c8b71a60f16fa3245acd09d5')
sha512sums=('81988915cafe388bc969035a9b5cc52138b4571622d9a5a418238962e89a73db60dea3151db7a8ce2b105854e50fd15de728661d356a1507028324462ae648e3')

build() {
  cd "$pkgname-$pkgver"

  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/git-gone.1" "$pkgdir/usr/share/man/man1/git-gone.1"
}
