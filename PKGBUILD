# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=thumbs
pkgver=0.6.0
pkgrel=1
pkgdesc='Copy/pasting like vimium/vimperator'
arch=('x86_64')
url=https://github.com/fcsonline/tmux-thumbs
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
optdepends=('bash: for tmux integration'
            'tmux: for tmux integration')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        '0001-Global-install.patch')
b2sums=('706833eba52a29ddde6d8fc400de547c90c6a7552eca82392d026a4cb535f166c7065804ea39fed7099f45c6f9c7ffcdc02e1594a73f441dbf4d446bcc4197e8'
        '2161a433de291d3b6bce06e96750f44fbbb042fb26a568f022cf4fd1dfc7af2ecb2b1452032a6447b6459f4b80a7f6bee739d8af1769bd0e5c75cd318fd2682a')

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
