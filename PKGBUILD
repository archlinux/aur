# Maintainer: Andy Locks <jandylokc@gmail.com>
pkgname=irnix
pkgver=0.0.5
pkgrel=1
pkgdesc='A system for organizing objects, which turns the file system into objects with methods and contracts.'
arch=('x86_64')
url="https://github.com/AndyLocks/irnix"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('ec7309542107a11bc5ed051cc44e1c7455c1358320138f28a5b0eb2f176793af')

build() {
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgname-v$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"

  "$pkgdir/usr/bin/$pkgname" completions bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "$pkgdir/usr/bin/$pkgname" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "$pkgdir/usr/bin/$pkgname" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
