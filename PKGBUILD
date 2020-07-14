# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=thumbs
pkgver=0.4.3
pkgrel=1
pkgdesc='Copy/pasting like vimium/vimperator'
arch=('x86_64')
url=https://github.com/fcsonline/tmux-thumbs
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
optdepends=('bash: for tmux integration')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download"
        'global_install.patch')
sha512sums=('4d20116ff24b6b2fcadcdc2f18caf1978fb1d87c3f094ac18af80fe0861a395bc13a70fed769583688478a6c6884ea5f4285f63977ae80ceda88e8a8987a0274'
            '36faa7f55b6fdfcfda7466289aa4094e387790fe628270713fbb4beb59034d011d6991a81f9bcc0ea0c230400c6498c0cf396083aa69ee25caf155b94310faa5')

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
