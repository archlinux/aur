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
sha256sums=('00a4b440f0921519a56cdf6b119e268d18b952d852bfddccbdeee736c838d7f7')

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
