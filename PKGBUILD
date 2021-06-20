# Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=sad
pkgver=0.4.8
pkgrel=1
pkgdesc="Space Age seD"
arch=("x86_64")
url="https://github.com/ms-jpq/sad"
license=('MIT')
makedepends=('rust')
depends=('gcc-libs')
optdepends=('fzf: for tui usage'
            'diff-so-fancy: diff colourizer'
            'git-delta-git: diff colourizer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ms-jpq/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b242359e9983e98c371e4bf9115437f746344edd45f6bae376b197e05a15b995')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release  --all-features

}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sts=2 sw=2 et :
