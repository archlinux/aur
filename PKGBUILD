pkgname=kalc
pkgver=1.3.3
pkgrel=3
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
depends=('gmp' 'mpfr')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3ae1810cd552fa3918dcf783be4b8cb9adde9b58f8e4ba23e1549fb0738cbc1904e337b17ca7a2f2343396652369bc1796223b7c9ee47dc1d6cd89b9edf80e74')
build()
{
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release||(
  sed -i 's/\["force-cross"\]/\["use-system-libs"\]/g' Cargo.toml
  cargo build --release
  )
}
package()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
