pkgname=kalc
pkgver=1.5.0
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
depends=('gmp' 'mpfr')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f0137d0bbddbe069b4ed7350463121b9c86eccf60244a75a0e95f5b2d20c05281d912979a30390672fa533bb80b9aa8065fb16f3391af70cd4c921e44c948d3d')
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
