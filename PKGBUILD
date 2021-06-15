# Maintainer: George Rawlinson <george@rawlinson.net.nz> 

pkgname=lxd-snapper
pkgver=1.1
pkgrel=1
pkgdesc="A tool that automates creating & removing LXD snapshots"
arch=('x86_64')
url="https://github.com/Patryk27/lxd-snapper"
license=('MIT')
depends=('lxd' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('93322f96499426495df1191efc26f36881ad259c7445e7cdbfeea16be043a92af5103368e781a2ea45e9de93db02068adea18161b595e28253a37ca937f2c77a')

build() {
	cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

package() {
	cd "$pkgname-$pkgver"

  # binary
  install -vDm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -r docs/example-configs "$pkgdir/usr/share/doc/$pkgname"
  chmod 644 "$pkgdir/usr/share/doc/$pkgname/example-configs/"*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
