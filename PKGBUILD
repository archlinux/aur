# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cargo-edit
pkgver=0.3.0
pkgrel=1
pkgdesc='A utility for managing cargo dependencies from the command line.'
arch=('i686' 'x86_64')
url='https://github.com/killercup/cargo-edit'
license=('MIT')
depends=('cargo')
conflicts=('cargo-edit-git')
provide=('cargo-edit')
source=("https://github.com/killercup/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d8fb376fd771dd78121121a1130ef89be5ba62d085a13849352be2917a6224a3')

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
