# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=thumbs
pkgver=0.5.1
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
b2sums=('9e62fd3d68803cc502ea54789eaf637a34b74d7c816d1b0d23b5d710a0a18b785b6f87010005c6fd28b2847c0ed18e06dea7fe487e70380ad192e2e560ad5be3'
        '0f1f7f9bfe0e44cd3d1851978189c21a8f22b27f90e75d8d5f75f6ca6b80aad334b9df71cc272e11fff55dc2767960ce60c74d93df3194e552fab331d4467dc0')

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
