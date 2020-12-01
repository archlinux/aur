# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=thumbs
pkgver=0.5.0
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
        '0001-Global-install.patch')
b2sums=('a8778587a552a6d154a38a0c30f94b437ed3f82db27bb6645f7beb8adee05178a27b193493c472e6d44a364b637ef041ef60609a0c28d24b0d18cec99575f4b2'
        'a46783bcf71b20c8d37944eea9bd2061f372b1a1ecf9a07e26890c03db043f1c4f4ad09918c7fa958be7e20bce11befd5f98aaa07a357ecce19ab33595f0c682')

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input=../0001-Global-install.patch
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
