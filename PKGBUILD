# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=in
pkgver=1.7.4
pkgrel=1
pkgdesc='Create a directory if needed, then run the given command there'
arch=(x86_64)
url='https://github.com/xyproto/in'
license=(BSD)
makedepends=(git rust)
source=("git+$url#tag=v$pkgver")
b2sums=('a53dd50cd1f85bf911a9153294066538ce2045b648435b4a8ca0af89e1fdd45d0917409f6a097adeb5dd0b13c6f8133e10c7db4965aabd164d942cb64bc4ee02')

build() {
  export CFLAGS+=' -ffat-lto-objects -w'
  cargo build --manifest-path $pkgname/Cargo.toml --release
}

package() {
  cd $pkgname
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
