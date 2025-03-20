pkgname=kalc
pkgver=1.4.3
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
depends=('gmp' 'mpfr')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d3683ae5e57b687cf8a33370126853f2d04eed0028ace6469ad04b3a32715b98c1ec2dd9a3a83a07f05c4db76c5fae261b68af767ea4bf5125b269b6c1b9a92d')
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
