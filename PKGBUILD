# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=in
pkgver=1.7.2
pkgrel=1
pkgdesc='Create a directory if needed, then run the given command there'
arch=(x86_64)
url='https://github.com/xyproto/in'
license=(BSD)
makedepends=(git rust)
source=("git+$url#commit=268db1b992c4b4153aa1899646f3e6edb1bedfcd") # tag: 1.7.2
b2sums=(SKIP)

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
