# Maintainer: Loïc Damien <loic.damien at dzamlo dot ch>
pkgname=treeify
pkgver=0.1.4
pkgrel=1
pkgdesc="converts the output of a command that lists files into a tree representation similar to \
         the output of the command tree"
arch=('i686' 'x86_64')
url="https://github.com/dzamlo/treeify"
license=('MIT' 'Apache')
depends=(gcc-libs)
makedepends=(cargo)
source=("https://github.com/dzamlo/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('e5e112f958c78a590db12e67f1d2d3b84236e1315bb6e058b3112985c01cbc4a')

build() {
  cd "$pkgname-$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "target/release/build/$pkgname-"*"/out/${pkgname}_bash.sh" \
      "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
