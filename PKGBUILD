# Maintainer: greypilgrim 3365280-greypilgrim@users.noreply.gitlab.com

pkgname=cleanpkgdir
pkgver=1.0.0
pkgrel=1
pkgdesc="Prunes old packages from provided directory"
arch=('x86_64')
url="https://gitlab.com/greypilgrim/rust-scripts"
license=('GPL3')
depends=('rust' 'cargo')
makedepends=('git')
source=("rust-scripts-$pkgver.tar.gz::https://gitlab.com/greypilgrim/rust-scripts/-/archive/$pkgver/rust-scripts-$pkgver.tar.gz")
sha256sums=('6cbb057a406f1a35e6217cf17368f987deeac034162b7563f8a5f217e34c4ccc')

build() {
  tar -xvf "rust-scripts-$pkgver.tar.gz"
  cd "rust-scripts-$pkgver/$pkgname"
  cargo build --release
}

package() {
  cd "rust-scripts-$pkgver/$pkgname"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 docs/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
