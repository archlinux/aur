# Maintainer: Yuuki Rika <yvvki@duck.com>

pkgname=vale-ls
pkgver=0.4.0
pkgrel=2
pkgdesc='An implementation of the Language Server Protocol (LSP) for the Vale command-line tool.'
arch=(any)
url='https://github.com/errata-ai/vale-ls'
license=(MIT)
depends=(bzip2
	glibc
	gcc-libs
	vale)
makedepends=(cargo)

_pkgsrc=$pkgname-$pkgver
source=("$_pkgsrc.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6f9e1daa3e3bf22615203dc31cb2e0b646ca0e166ed63dd4626668d2da6448f404a866df115bdf34d392efdcf466e1c5d67c1de986bc6e1b0846263cfff93f79')

build() {
  CFLAGS+=' -ffat-lto-objects'
  cd $_pkgsrc
  cargo build --release
}

check() {
  cd $_pkgsrc
  cargo test --release
}

package() {
  cd $_pkgsrc
  install -Dm755 "target/release/vale-ls" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
