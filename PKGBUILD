pkgname=kalc-plot
pkgver=0.1.1
pkgrel=1
pkgdesc="a graphing program intended to be used with kalc"
arch=('any')
url="https://github.com/bgkillas/kalc-plot"
license=('GPL3')
depends=('gmp' 'mpfr')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc-plot/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ad5d174f3a4fd6e235b5be3c18f6f05f903541696f1aa3f39642c26f30719248ca1db7c6c237e031cd5fd135fd7220731057aef6114000ad609b289b21106314')
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
  install -D target/release/kalc-plot "$pkgdir/usr/bin/kalc-plot"
}
