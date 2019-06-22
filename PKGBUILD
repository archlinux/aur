# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cargo-edit
pkgver=0.3.3
pkgrel=2
pkgdesc='A utility for managing cargo dependencies from the command line.'
arch=('i686' 'x86_64')
url='https://github.com/killercup/cargo-edit'
license=('MIT')
depends=('cargo')
conflicts=('cargo-edit-git')
provide=('cargo-edit')
source=("https://github.com/killercup/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8b5df34e2df8002e9777daa983eef389d302526a0dce5e7a70a3cccf780b0064')

build() {
  cd "$pkgname-$pkgver" || exit 1
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  for sub in add rm upgrade; do
      install -Dm755 "target/release/cargo-$sub" "$pkgdir/usr/bin/cargo-$sub"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
