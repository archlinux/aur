pkgname=kalc
pkgver=1.4.1
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
depends=('gmp' 'mpfr')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8732c0df18c07077b8196376295f551bea744af8b9c7b200d5a496decde545d5f7846915f06df3d053a02a2c020aa684b3ca2fd6a23f9b6508f48e1500b87a0d')
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
