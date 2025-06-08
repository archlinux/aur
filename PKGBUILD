pkgname=kalc-plot
pkgver=0.1.2
pkgrel=2
pkgdesc="a graphing program intended to be used with kalc"
arch=('any')
url="https://github.com/bgkillas/kalc-plot"
license=('GPL3')
depends=('gmp' 'mpfr' 'libmpc')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make' 'openssl' 'pkg-config' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc-plot/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8ba21526e662056e1d58b19db7809c6fabbfe81273e65a4717839b54325232d549d242cc67877865116dd5a9778e14834909a24d2864000f5e62dde96972b7e4')
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
  install -D target/release/kalc-plot "$pkgdir/usr/bin/kalc-plot"
}
