pkgname=kalc
pkgver=1.5.1
pkgrel=2
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
depends=('gmp' 'mpfr' 'libmpc')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make' 'openssl' 'pkg-config' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0f62ea610c6d97f616bfa519d036df4c3980dd6db4cd81d67f7744c5af2aea969428bf55e9f4de82cb2a70edae7e0a724abb8385bb31da0da20b3db98061b3ea')
build()
{
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release||
  cargo build --release --features "system-libs"||
  CC=clang cargo build --release||
  CC=clang cargo build --release --features "system-libs"
}
package()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
