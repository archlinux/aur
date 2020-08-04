# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=thumbs
pkgver=0.4.4
pkgrel=1
pkgdesc='Copy/pasting like vimium/vimperator'
arch=('x86_64')
url=https://github.com/fcsonline/tmux-thumbs
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
optdepends=('bash: for tmux integration'
            'tmux: for tmux integration')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download"
        'global_install.patch')
sha512sums=('d6b6aa26ea5bf65c5a5b48afd0c00c17aab7369f7ca8e39a6d90e23bf9a6403f914744532ab196176b0d63975e4f0f2c301ad8b71d5818625489770209bb3892'
            'd83855f2724189d13bb1e5c71e03e3d0bf959d02308a3c5905280e6ee8133d14b272cccb7dfee85f1d280b4fd70c14a798bb2d62553bfd8dc097d78f6a6c8601')

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input=../global_install.patch
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/{,tmux-}$pkgname
  install -Dt "$pkgdir"/usr/share/$pkgname tmux-$pkgname.{sh,tmux}
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
