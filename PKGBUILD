# Maintainer: greypilgrim 3365280-greypilgrim@users.noreply.gitlab.com

pkgname=cleanpkgdir
pkgver=0.1.0
pkgrel=1
pkgdesc="Prunes old packages from provided directory"
arch=('x86_64')
url="https://gitlab.com/greypilgrim/rust-scripts"
license=('GPL3')
depends=('rust' 'cargo')
makedepends=('git')
source=("rust-scripts-$pkgver-dev.tar.gz::https://gitlab.com/greypilgrim/rust-scripts/-/archive/$pkgver-dev/rust-scripts-$pkgver-dev.tar.gz")
sha256sums=('21446e8174f2c2a72dcdd8a415dc8d99f932eda70f02989f5d1543702f450e2c')

build() {
  tar -xvf "rust-scripts-$pkgver-dev.tar.gz"
  cd "rust-scripts-$pkgver-dev/$pkgname"
  cargo build --release
}

package() {
  cd "rust-scripts-$pkgver-dev/$pkgname"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 docs/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
