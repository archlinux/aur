pkgname=kalc
pkgver=1.3.2
pkgrel=2
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
depends=('gmp' 'mpfr')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f722aac0ae8b1d73c231f7f10c269801109818b6c4914b804f45b49250be793be3cadfc4648b3021b941fa46452c4e28e392e77ded9849ac0dd812a2da5a7bba')
build()
{
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/["force-cross"]/["use-system-libs"]/g' Cargo.toml
  cargo build --release
}
package()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
