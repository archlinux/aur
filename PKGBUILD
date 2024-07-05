# Maintainer: Álvaro Jesús Baena Rosino <alvarojsino8 at gmail dot com>
pkgname='mecano'
pkgver='0.1.2'
pkgrel='1'
pkgdesc='Minimalistic typing train'
arch=('x86_64')
makedepends=('cargo')
source=(
   "https://github.com/alvarojsino813/mecano/archive/refs/tags/v$pkgver.tar.gz"
   )
license=('unlicense')

build() {
   cd "$srcdir/$pkgname-$pkgver/"
   cargo build --release --target-dir=target
   cd ../..
}

package() { 
   install -d "$pkgdir/usr/share/$pkgname/dictionaries"
   install -Dm755 "$srcdir/$pkgname-$pkgver/config.toml" "$pkgdir/usr/share/$pkgname/mecano.toml"
   cp -r "$srcdir/$pkgname-$pkgver/dictionaries/" "$pkgdir/usr/share/$pkgname/"
   install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mecano" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('127f7ef027c3250c2578b8f6de9533689cd9e282237cb381ba5300f335b616eb')
