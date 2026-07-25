# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=crabterm
pkgver=0.2.0
pkgrel=1
pkgdesc="A bit like picocom/minicom but also with server capabilities"
url="https://github.com/allannielsen/crabterm"
license=('MIT')
arch=('x86_64')
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8ed4807f8d8daa16daa7c8e5570bcdf77376e4c3b34aff97aa2dd1d55132e031acbcea1d3329d6d169d41d80059c49385dd4f05f7b431ce7317d1abec8019b9c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/$pkgname
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm644 -t "$pkgdir/usr/share/man/man1" $pkgname.1
}
