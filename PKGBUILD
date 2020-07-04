# Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=sad
pkgver=0.4.5
pkgrel=1
pkgdesc="Space Age seD"
arch=("x86_64")
url="https://github.com/cheat/cheat"
license=('MIT')
makedepends=('rust')
depends=('gcc-libs')
optdepends=('fzf: for tui usage'
            'diff-so-fancy: diff colourizer'
            'git-delta-git: diff colourizer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ms-jpq/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('65bcf6c3a40bdc139d68d73cb58d1aad2585f019e90485c31188177efe77fe66')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --all-features

}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sts=2 sw=2 et :
