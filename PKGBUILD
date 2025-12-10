# Maintainer: Andy Locks <jandylokc@gmail.com>
pkgname=stringp
pkgver=0.0.4
pkgrel=1
pkgdesc='A "key-value" utility for UNIX-like systems. Allows to conveniently store values and retrieve them by key.'
arch=('x86_64')
url="https://github.com/AndyLocks/string-pool"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('3646287e5ee0068f3950916d43ea27db1ff19117177861ed9700d411dac5a5d4')

build() {
  cd "$srcdir/string-pool-$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/string-pool-$pkgname-v$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"

  "$pkgdir/usr/bin/$pkgname" completions bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "$pkgdir/usr/bin/$pkgname" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "$pkgdir/usr/bin/$pkgname" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
