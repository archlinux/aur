# Maintainer: J.P. Ramackers <jramackers@proton.me>
pkgname=pycompile
pkgver=0.2.0
pkgrel=1
pkgdesc="Compile Python source files into standalone native binaries"
arch=('x86_64' 'aarch64')
url="https://github.com/ramackersjp/pycompile"
license=('MIT')
depends=('gcc')
makedepends=('cargo')
provides=('python-compiler')
conflicts=('python-compiler')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('26e8cfe6f1f5227adcbe86ad9845bcae5fceae9a6c9176369adaca6bd951ca32')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/pycompile "$pkgdir/usr/bin/pycompile"
  install -Dm755 target/release/python_compiler "$pkgdir/usr/bin/python_compiler"
  install -Dm644 docs/pycompile.1 "$pkgdir/usr/share/man/man1/pycompile.1"
  install -Dm644 docs/pycompile.1 "$pkgdir/usr/share/man/man1/python_compiler.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
